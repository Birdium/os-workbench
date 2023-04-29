#include <spinlock.h>

// static kmt_spin_cpu_cnt[MAX_CPU];

void kmt_spin_init(spinlock_t *lk, const char *name) {
    lk->locked = 0;
    lk->name = name;
}

void kmt_spin_lock(spinlock_t *lk) {
    // TODO:
    bool i = ienabled();
    iset(false);
    while(atomic_xchg(&lk->locked, 1) != 0);
    if (i) iset(true);
}

void kmt_spin_unlock(spinlock_t *lk) {
    //TODO: spin unlock
}