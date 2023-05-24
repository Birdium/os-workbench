#ifndef KMT_H
#define KMT_H

#include "am.h"
#include "list.h"
#include <os.h>

#define KMT_STACK_SIZE 8192
#define MAX_TASK_NUM 256

DEF_LIST(irq_t);
DEF_LIST(task_t);

void kmt_sem_init(sem_t *sem, const char *name, int value);

void kmt_sem_signal(sem_t *sem);

void kmt_sem_wait(sem_t *sem);

void kmt_spin_init(spinlock_t *lk, const char *name);

void kmt_spin_lock(spinlock_t *lk);

void kmt_spin_unlock(spinlock_t *lk);

#endif