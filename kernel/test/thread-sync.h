#ifndef THREAD_SYNC_H
#define THREAD_SYNC_H

#include <semaphore.h>

// // Spinlock
// typedef int myspinlock_t;
// #define SPIN_INIT() 0

// static inline int atomic_xchg(volatile int *addr, int newval) {
//   int result;
//   asm volatile ("lock xchg %0, %1":
//     "+m"(*addr), "=a"(result) : "1"(newval) : "memory");
//   return result;
// }

// static inline void myspin_lock(myspinlock_t *lk) {
//   while (1) {
//     intptr_t value = atomic_xchg(lk, 1);
//     if (value == 0) {
//       break;
//     }
//   }
// }

// static inline void myspin_unlock(myspinlock_t *lk) {
//   atomic_xchg(lk, 0);
// }

// // Mutex
// typedef pthread_mutex_t mutex_t;
// #define MUTEX_INIT() PTHREAD_MUTEX_INITIALIZER
// static inline void mutex_lock(mutex_t *lk)   { pthread_mutex_lock(lk); }
// static inline void mutex_unlock(mutex_t *lk) { pthread_mutex_unlock(lk); }

// Mutex
typedef pthread_mutex_t myspinlock_t;
#define SPIN_INIT() PTHREAD_MUTEX_INITIALIZER
static inline void myspin_lock(myspinlock_t *lk)   { pthread_mutex_lock(lk); }
static inline void myspin_unlock(myspinlock_t *lk) { pthread_mutex_unlock(lk); }

// Conditional Variable
typedef pthread_cond_t cond_t;
#define COND_INIT() PTHREAD_COND_INITIALIZER
#define cond_wait pthread_cond_wait
#define cond_broadcast pthread_cond_broadcast
#define cond_signal pthread_cond_signal

// Semaphore
#define P sem_wait
#define V sem_post
#define SEM_INIT(sem, val) sem_init(sem, 0, val)

#endif