#include "list.h"
#include <common.h>
#include <buddy.h>
#include <os.h>

task_t *current[MAX_CPU_NUM], tasks[MAX_CPU_NUM];

#ifdef DEBUG_LOCAL
task_t *task_alloc() {
  return pmm->alloc(sizeof(task_t));
}

sem_t empty, fill;
#define P kmt->sem_wait
#define V kmt->sem_signal
#define N 1
#define NPROD 1
#define NCONS 1

void Tproduce(void *arg) { while (1) { P(&empty); putch('('); V(&fill);  } }
void Tconsume(void *arg) { while (1) { P(&fill);  putch(')'); V(&empty); } }

#endif

static void os_init() {
  pmm->init();
  kmt->init();

#ifdef DEBUG_LOCAL

  kmt->sem_init(&empty, "empty", N);
  kmt->sem_init(&fill,  "fill",  0);
  for (int i = 0; i < NPROD; i++) {
    kmt->create(task_alloc(), "producer", Tproduce, NULL);
  }
  for (int i = 0; i < NCONS; i++) {
    kmt->create(task_alloc(), "consumer", Tconsume, NULL);
  }
#endif
}

#ifndef TEST
static void os_run() {
  iset(true);
  printf("Hello World from CPU #%d\n", cpu_current());
  while (1) {
    // yield();
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

LIST_PTR_DEC_EXTERN(task_t_ptr, task_list);

static void debug_task_list() {
  int cnt = 0;
  for_list(task_t_ptr, it, task_list) {
    LOG_INFO("task %d: %s", cnt, it->elem->name);
    cnt++;
  }
}

Context *os_trap(Event ev, Context *context) {
  TRACE_ENTRY;
  LOG_INFO("context saving of %s with ctx at %p, event type %d", cur_task->name, context, ev.event);
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
  LOG_INFO("os trap returing %p", next);
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
