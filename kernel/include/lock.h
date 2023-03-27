#ifndef LOCK_H
#define LOCK_H
typedef int spinlock_t;
#define SPIN_INIT() 0
void spin_lock(spinlock_t *lk);
void spin_unlock(spinlock_t *lk);
#endif