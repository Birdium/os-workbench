#include <common.h>
#include <lock.h>

void spin_lock(spinlock_t *lk) {
  while (atomic_xchg(&lk->status, 1));
}

void spin_unlock(spinlock_t *lk) {
  atomic_xchg(&lk->status, 0);
}
