#ifndef OS_H
#define OS_H

#include <common.h>
#include <list.h>

#define CANARY_NUM 114514

typedef struct task {
  enum {SLEEPING, RUNNABLE} status;
  int running;
  const char *name;
  Context *context;
  uint8_t *stack;

  // utask only
  pid_t pid;
  pid_t ppid;
  AddrSpace as;
  int canary;
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

#define cur_task current[cpu_current()]

#endif