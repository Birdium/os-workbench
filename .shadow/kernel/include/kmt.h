#ifndef KMT_H
#define KMT_H

#include "am.h"
#include <os.h>

#define KMT_STACK_SIZE 4096

DEF_LIST(irq_t);

void kmt_sem_init(sem_t *sem, const char *name, int value);

void kmt_sem_signal(sem_t *sem);

void kmt_sem_wait(sem_t *sem);

void kmt_spin_init(spinlock_t *lk, const char *name);

void kmt_spin_lock(spinlock_t *lk);

void kmt_spin_unlock(spinlock_t *lk);

#endif