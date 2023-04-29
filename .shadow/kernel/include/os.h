#ifndef OS_H
#define OS_H

#include <common.h>
#include <list.h>

typedef Context *(*handler_t)(Event, Context *);

#define STACK_SIZE 4096

typedef struct task {
  union {
    struct {
      int status;
      int id;
      const char *name;
      struct task *next;
      Context *context;
    };
    uint8_t stack[STACK_SIZE];
  };
} task_t;

typedef struct spinlock {
  int locked;
  const char *name;
} spinlock_t;

typedef struct semaphore {
  // TODO
} sem_t;

typedef struct irq {
  int seq;
  int event; 
  handler_t handler;
} irq_t;

DEF_LIST(irq_t);
#endif