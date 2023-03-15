#include <klib.h>

void spin_lock(spinlock_t *lk) {
  while (1) {
    intptr_t value = atomic_xchg(lk, 1);
    if (value == 0) {
      break;
    }
  }
}

void spin_unlock(spinlock_t *lk) {
  atomic_xchg(lk, 0);
}