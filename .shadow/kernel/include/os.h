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

struct irq_list {
  struct irq irq;
  struct irq_list *prev, *next;
};