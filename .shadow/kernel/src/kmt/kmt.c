#include "am.h"
#include "common.h"
#include "klib-macros.h"
#include "list.h"
#include <assert.h>
#include <os.h>
#include <limits.h>
#include <kmt.h>
#include <stdio.h>

extern task_t *current[MAX_CPU_NUM];

LIST_PTR_DEC(irq_t, irq_list);

static Context *kmt_context_save(Event ev, Context *context) {
    int cpu = cpu_current();
    panic_on(!current[cpu], "no valid task");
    current[cpu]->status = SLEEPING;
    current[cpu]->context = context;
    return NULL;
}

static Context *kmt_schedule(Event ev, Context *context) {
    // TODO: feat
    return NULL;
}

static void kmt_init() {
    for (int cpu = 0; cpu < cpu_count(); cpu++) {
        // init idle
        task_t *task = pmm->alloc(sizeof(task_t));
        panic_on(!task, "alloc failed");
        // 8 for "idle XX\0"
        char *name = pmm->alloc(8);
        sprintf(name, "idle %d", cpu);

        task->name = name;
        task->status = RUNNING;
        task->stack = pmm->alloc(KMT_STACK_SIZE);
        task->context = NULL;
        task->next = NULL;
        current[cpu] = task;
    }
    LIST_PTR_INIT(irq_t, irq_list);
    os->on_irq(INT_MIN, EVENT_NULL, kmt_context_save);
    os->on_irq(INT_MAX, EVENT_NULL, kmt_schedule);
}

static int kmt_create(task_t *task, const char *name, void (*entry)(void *arg), void *arg) {
    task->name = name;
    task->status = RUNNABLE;
    task->stack = pmm->alloc(KMT_STACK_SIZE);
    task->context = kcontext(
        (Area){
            .start = task->stack, 
            .end = task->stack + KMT_STACK_SIZE
        }, entry, arg
    );
    task->next = NULL;
    return 0;
}

static void kmt_teardown(task_t *task) {
    //TODO: kmt teardown
}

MODULE_DEF(kmt) = {
    .init = kmt_init,
    .create = kmt_create,
    .teardown = kmt_teardown,
    .sem_init = kmt_sem_init,
    .sem_signal = kmt_sem_signal,
    .sem_wait = kmt_sem_wait,
    .spin_init = kmt_spin_init,
    .spin_lock = kmt_spin_lock,
    .spin_unlock = kmt_spin_unlock,
};
