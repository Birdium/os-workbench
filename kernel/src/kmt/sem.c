#include "am.h"
#include "list.h"
#include <kmt.h>

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
		// TODO: remove task from queue
	}
	kmt->spin_unlock(&sem->lk);
}

void kmt_sem_wait(sem_t *sem) {
	kmt->spin_lock(&sem->lk);
	while (sem->cnt == 0) {
		// TODO: add current task to wait list
		kmt->spin_unlock(&sem->lk);
		yield();
		kmt->spin_lock(&sem->lk);
	}
	--sem->cnt;
	kmt->spin_unlock(&sem->lk);
}