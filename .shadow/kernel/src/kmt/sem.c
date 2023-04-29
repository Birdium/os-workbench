#include "list.h"
#include <kmt.h>

void kmt_sem_init(sem_t *sem, const char *name, int value) {
	sem->name = name;
	sem->cnt = value;
	kmt->spin_init(&sem->lk, name);
	LIST_INIT(task_t, &sem->tasks);
	panic("114");
}

void kmt_sem_signal(sem_t *sem) {
    //TODO: sem signalirq_t
}

void kmt_sem_wait(sem_t *sem) {
    //TODO: sem wait
}