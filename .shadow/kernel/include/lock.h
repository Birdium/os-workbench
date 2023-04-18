#ifndef MYLOCK_H
#define MYLOCK_H
typedef int myspinlock_t;
#define MYSPIN_INIT() 0
static inline void myspin_lock(myspinlock_t *lk) {
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

static inline void myspin_unlock(myspinlock_t *lk) {
  atomic_xchg(lk, 0);
}
#endif