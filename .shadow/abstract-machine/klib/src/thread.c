#include <klib.h>

void _spin_lock(_spinlock_t *lk) {
  while (1) {
    intptr_t value = atomic_xchg(lk, 1);
    if (value == 0) {
      break;
    }
  }
}

void _spin_unlock(_spinlock_t *lk) {
  atomic_xchg(lk, 0);
}