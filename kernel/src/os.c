#include "list.h"
#include <common.h>
#include <buddy.h>
#include <os.h>

task_t *current, tasks[MAX_CPU_NUM];

static void os_init() {
  pmm->init();
  kmt->init();
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

Context *os_trap(Event ev, Context *context) {
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
