#ifndef SPINLOCK_H
#define SPINLOCK_H

#include "am.h"
#include <os.h>

void kmt_spin_init(spinlock_t *lk, const char *name);

void kmt_spin_lock(spinlock_t *lk);

void kmt_spin_unlock(spinlock_t *lk);

#endif