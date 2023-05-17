#include "list.h"
#include <common.h>
#include <buddy.h>
#include <os.h>
#include <devices.h>

task_t *current[MAX_CPU_NUM], tasks[MAX_CPU_NUM];

task_t *task_alloc() {
  return pmm->alloc(sizeof(task_t));
}

#ifdef DEBUG_LOCAL
sem_t empty, fill;
#define P kmt->sem_wait
#define V kmt->sem_signal
#define N 10
#define NPROD 5
#define NCONS 5

void Tproduce(void *arg) { while (1) { P(&empty); putch('('); V(&fill);  } }
void Tconsume(void *arg) { while (1) { P(&fill);  putch(')'); V(&empty); } }

void foo(void *s) { while (1) putch(*((const char *)s)); }

#endif

#ifdef DEBUG_DEV
static void tty_reader(void *arg) {
  device_t *tty = dev->lookup(arg);
  char cmd[128], resp[128], ps[16];
  snprintf(ps, 16, "(%s) $ ", (char*)arg);
  while (1) {
    tty->ops->write(tty, 0, ps, strlen(ps));
    int nread = tty->ops->read(tty, 0, cmd, sizeof(cmd) - 1);
    cmd[nread] = '\0';
    sprintf(resp, "tty reader task: got %d character(s).\n", strlen(cmd));
    tty->ops->write(tty, 0, resp, strlen(resp));
  }
}
#endif

static void os_init() {
  pmm->init();
  kmt->init();

#ifdef DEBUG_LOCAL

  // kmt->create(task_alloc(), "fooA", foo, "a");
  // kmt->create(task_alloc(), "fooB", foo, "b");

  kmt->sem_init(&empty, "empty", N);
  kmt->sem_init(&fill,  "fill",  0);
  for (int i = 0; i < NPROD; i++) {
    kmt->create(task_alloc(), "producer", Tproduce, NULL);
  }
  for (int i = 0; i < NCONS; i++) {
    kmt->create(task_alloc(), "consumer", Tconsume, NULL);
  }
#endif

#ifdef DEBUG_DEV
  dev->init();
  kmt->create(task_alloc(), "tty_reader1", tty_reader, "tty1");
  kmt->create(task_alloc(), "tty_reader2", tty_reader, "tty2");
#endif

}

#ifndef TEST
static void os_run() {
  iset(true);
  while (1) {
    // yield();
    // putch('c');
  }
}
#else 
static void os_run() {
  panic("Not implemented");
  printf("Testing\n");
  while (1) ;
}
#endif

DEF_LIST(irq_t);
LIST_PTR_DEC_EXTERN(irq_t, irq_list);

static inline bool sane_context(Context *ctx) {
  // TODO: feat sane context
  return true;
}

#define cur_task current[cpu_current()]

extern spinlock_t *task_list_lk;

LIST_PTR_DEC_EXTERN(task_t_ptr, task_list);

static void debug_task_list() {
  LOG_INFO("task list size %d", task_list->size);
  // int cnt = 0;
  // kmt->spin_lock(task_list_lk);
  // for_list(task_t_ptr, it, task_list) {
  //   LOG_INFO("task %d: %s, status: %d", cnt, it->elem->name, it->elem->status);
  //   cnt++;
  // }
  // kmt->spin_unlock(task_list_lk);
}

Context *os_trap(Event ev, Context *context) {
  TRACE_ENTRY;
  LOG_INFO("task (%s)%p, ctx at %p, rip %x, intr type %d", cur_task->name, cur_task, context, context->rip, ev.event);
  debug_task_list();
  Context *next = NULL;
  for_list(irq_t, it, irq_list) {
    if (it->elem.event == EVENT_NULL || it->elem.event == ev.event) {
      Context *r = it->elem.handler(ev, context);
      panic_on(r && next, "returning multiple contexts");
      if (r) next = r;  
    }
  }
  panic_on(!next, "returning NULL context");
  panic_on(!sane_context(next), "returning to invalid context");
  // LOG_INFO("trap returning %p with rip %x", next, next->rip);
  TRACE_EXIT;
  return next;
}

void os_on_irq(int seq, int event, handler_t handler) {
  irq_t irq = {
    .seq = seq,
    .event = event,
    .handler = handler
  };
  for_list(irq_t, it, irq_list) {
    if (seq < it->elem.seq) {
      irq_list->insert_prev(irq_list, it, irq);
      return;
    }
  }
  irq_list->push_back(irq_list, irq);
}

MODULE_DEF(os) = {
  .init = os_init,
  .run  = os_run,
  .trap = os_trap,
  .on_irq = os_on_irq,
};
