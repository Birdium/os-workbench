#include <common.h>

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
