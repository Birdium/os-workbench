#ifndef OS_H
#define OS_H

#include <common.h>
#include <list.h>

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

typedef task_t* task_t_ptr;

typedef struct spinlock {
  int locked;
  const char *name;
  int cpu;
} spinlock_t;

DEF_LIST(task_t_ptr);

typedef struct semaphore {
  int cnt;
  const char *name;
  spinlock_t lk;
  LIST_DEC(task_t_ptr, tasks);
} sem_t;

typedef struct irq {
  int seq;
  int event; 
  handler_t handler;
} irq_t;

#endif