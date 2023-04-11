#ifndef LOCK_H
#define LOCK_H
typedef int spinlock_t;
#define SPIN_INIT() 0
static inline void spin_lock(spinlock_t *lk) {
  while (1) {
    int value = atomic_xchg(lk, 1);
    if (value == 0) {
      break;
    }
  }
  putch('a');
}

static inline void spin_unlock(spinlock_t *lk) {
  atomic_xchg(lk, 0);
}
#endif