#ifndef LOCK_H
#define LOCK_H
typedef int spinlock_t;
#define SPIN_INIT() 0
static inline void spin_lock(spinlock_t *lk) {
  int cnt = 0;
  while (1) {
    int value = atomic_xchg(lk, 1);
    if (value == 0) {
      break;
    }
    ++cnt;
    if (cnt > 100000000) {
      LOG_LOCK("DEAD LOCK"); 
      assert(0);
    }
  }
}

static inline void spin_unlock(spinlock_t *lk) {
  atomic_xchg(lk, 0);
}
#endif