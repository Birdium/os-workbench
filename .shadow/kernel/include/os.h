#ifndef OS_H
#define OS_H

#include <common.h>
#include <list.h>

struct task {
  // TODO
};

struct spinlock {
  int locked;
  const char *name;
};

struct semaphore {
  // TODO
};

struct irq {
  int seq;
  int event; 
  handler_t handler;
};

#endif