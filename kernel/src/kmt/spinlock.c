#include "am.h"
#include "common.h"
#include "klib-macros.h"
#include <spinlock.h>

static bool intena[MAX_CPU_NUM];
static int noff[MAX_CPU_NUM];

#define cur_noff noff[cpu_current()]
#define cur_intena intena[cpu_current()]

void kmt_spin_init(spinlock_t *lk, const char *name) {
    lk->locked = 0;
    lk->name = name;
	lk->cpu = -1;
}

static void push_off() {
	bool i = ienabled();
	iset(false);
	if (cur_noff == 0) {
		cur_intena = i;
	}
	cur_noff++;
}

static void pop_off() {
	panic_on(ienabled(), "pop off - interruptible");
	panic_on(cur_noff < 1, "pop off");
	cur_noff--;
	if (cur_noff == 0 && cur_intena) {
		iset(true);
	}
}

static int holding(spinlock_t *lk) {
	return lk->locked && lk->cpu == cpu_current();
}

void kmt_spin_lock(spinlock_t *lk) {
	push_off();
	panic_on(holding(lk), "kmt_spin_lock: locking holding lock");
    while(atomic_xchg(&lk->locked, 1) != 0)
		;
	__sync_synchronize();
	lk->cpu = cpu_current();
}

void kmt_spin_unlock(spinlock_t *lk) {
	panic_on(!holding(lk), "kmt_spin_unlock: releasing unholding lock");
    lk->cpu = -1;
	__sync_synchronize();
	atomic_xchg(&lk->locked, 0);
	pop_off();
}