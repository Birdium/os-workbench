#ifndef TEST
#include <lock.h>
#include <stdatomic.h>
#include <stdint.h>
static int atomic_xchg(int *addr, int newval) {
  return atomic_exchange((int *)addr, newval);
}
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
#endif
