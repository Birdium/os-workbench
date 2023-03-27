#include <common.h>
#ifndef TEST
#include <lock.h>
#endif

void spin_lock(spinlock_t *lk) {
  while (atomic_xchg(&lk->status, 1));
}

void spin_unlock(spinlock_t *lk) {
  atomic_xchg(&lk->status, 0);
}
