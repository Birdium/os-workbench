#ifndef SPINLOCK_H
#define SPINLOCK_H

typedef struct {
  int status; 
} spinlock_t;

void spin_lock(spinlock_t *);
void spin_unlock(spinlock_t *);
#endif