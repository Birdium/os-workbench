#ifndef LOCK_H
#define LOCK_H
typedef int spinlock_t;
#define SPIN_INIT() 0
static inline void spin_lock(spinlock_t *lk) {
  for (volatile int i = 0; i < 10000; i++)
  while (1) {
    int value = atomic_xchg(lk, 1);
    if (value == 0) {
      break;
    }
  }
}

static inline void spin_unlock(spinlock_t *lk) {
  atomic_xchg(lk, 0);
}
#endif