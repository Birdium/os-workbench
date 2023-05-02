#include "am.h"
#include "list.h"
#include "os.h"
#include <assert.h>
#include <kmt.h>

extern task_t *current[MAX_CPU_NUM];

void kmt_sem_init(sem_t *sem, const char *name, int value) {
	sem->name = name;
	sem->cnt = value;
	kmt->spin_init(&sem->lk, name);
	LIST_INIT(task_t_ptr, &sem->tasks);
}

void kmt_sem_signal(sem_t *sem) {
	kmt->spin_lock(&sem->lk);
	++sem->cnt;
	if (sem->tasks.size > 0) {
		int idx = rand() % sem->tasks.size;
		task_t_ptr_list_node *p = sem->tasks.head;
		for (int i = 0; i < idx; i++) {
			p = p->next;
		}
		task_t *ntask = p->elem;
		sem->tasks.remove(&sem->tasks, p);
		ntask->status = RUNNABLE;
	}
	kmt->spin_unlock(&sem->lk);
}

void kmt_sem_wait(sem_t *sem) {
	kmt->spin_lock(&sem->lk);
	--sem->cnt;
	if (sem->cnt < 0) {
		sem->tasks.push_back(&sem->tasks, current[cpu_current()]);		
		current[cpu_current()]->status = SLEEPING;
		kmt->spin_unlock(&sem->lk);
		yield();
	}
	kmt->spin_unlock(&sem->lk);
}