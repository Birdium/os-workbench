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

#define cur_task current[cpu_current()]

LIST_PTR_DEC(irq_t, irq_list);
LIST_PTR_DEC(task_t_ptr, task_list);

spinlock_t *task_list_lk;

static Context *kmt_context_save(Event ev, Context *context) {
    panic_on(!cur_task, "no valid task");
    LOG_INFO("context saving of %s, event type %d", cur_task->name, ev.event);
    switch (ev.event) {
        case EVENT_YIELD:
            cur_task->status = SLEEPING;
            break;
        case EVENT_IRQ_TIMER:
            cur_task->status = RUNNABLE;
            break;
        default:
            cur_task->status = RUNNABLE;
            break;
    }
    cur_task->context = context; 
    LOG_INFO("ctx saved of %p", cur_task->context);
    return NULL;
}

static Context *kmt_schedule(Event ev, Context *context) {
    int cpu = cpu_current();
    panic_on(cur_task == NULL, "no available task");
    LOG_INFO("current task: %s, status %d, itr type %d", cur_task->name, cur_task->status, ev.event);
    panic_on(cur_task->name[0] == 'c' && ev.event == EVENT_ERROR, "consumer error");
    switch (ev.event) {
        case EVENT_YIELD:
        // schedule to other tasks
        {   
            kmt->spin_lock(task_list_lk);
            task_t *next_task = task_list->front(task_list);
            task_list->pop_front(task_list);
            kmt->spin_unlock(task_list_lk);
            cur_task = next_task;
        }
            break;
        case EVENT_IRQ_TIMER:
        {
            kmt->spin_lock(task_list_lk);
            task_list->push_back(task_list, cur_task);
            task_t *next_task = task_list->front(task_list);
            task_list->pop_front(task_list);
            kmt->spin_unlock(task_list_lk);
            cur_task = next_task;
        }
            break;
        default:
            break;
    }
    return current[cpu]->context;
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
        LOG_INFO("task init on CPU %d, name: %s, addr: %p", cpu, name, task);
    }
    LIST_PTR_INIT(irq_t, irq_list);
    os->on_irq(INT_MIN, EVENT_NULL, kmt_context_save);
    os->on_irq(INT_MAX, EVENT_NULL, kmt_schedule);
    LIST_PTR_INIT(task_t_ptr, task_list);
    task_list_lk = pmm->alloc(sizeof(task_list_lk));
    kmt->spin_init(task_list_lk, "task list lock");
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
    kmt->spin_lock(task_list_lk);
    task_list->push_back(task_list, task);
    kmt->spin_unlock(task_list_lk);
    LOG_INFO("task created name: %s, addr: %p", name, task);
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
