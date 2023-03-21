#include <common.h>
#include <lock.h>

void lock(lock_t *lk) {
  while (atomic_xchg(&lk->status, 1));
}

void unlock(lock_t *lk) {
  atomic_xchg(&lk->status, 0);
}
