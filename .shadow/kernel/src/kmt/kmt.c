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
task_t *idle_task[MAX_CPU_NUM];
task_t *last_task[MAX_CPU_NUM];

int task_cnt = 0;
task_t *task_list[MAX_TASK_NUM];


#define cur_task current[cpu_current()]
#define cur_idle idle_task[cpu_current()]
#define cur_last last_task[cpu_current()]

LIST_PTR_DEC(irq_t, irq_list);

spinlock_t *task_list_lk;

static Context *kmt_context_save(Event ev, Context *context) {
    TRACE_ENTRY;
    panic_on(!cur_task, "no valid task");

    cur_task->context = context; 
    return NULL;
}

static inline task_t *poll_rand_task() {
    task_t *result = cur_idle;
    if (task_cnt == 0) return idle_task[cpu_current()];  
    // int idx = rand() % task_list->size;
    while (1) {
        int idx = 0;
        task_t *task = task_list[idx];
        if (task->status != SLEEPING) { // FIXME: should atomic change status
            result = task;
            break;
        }
    }
    return result;
}

static Context *kmt_schedule(Event ev, Context *context) {
    int cpu = cpu_current();
    panic_on(cur_task == NULL, "no available task");
    // switch (ev.event) {
    //     case EVENT_YIELD: case EVENT_IRQ_TIMER: case EVENT_IRQ_IODEV:
    //     // schedule to other tasks
    //     {   
    kmt->spin_lock(task_list_lk);
    if (cur_task->status != SLEEPING) {
        if (cur_task != idle_task[cpu_current()]) {
            // TODO: do some thing
            // task_list->push_back(task_list, cur_task);
        }
    }
    task_t *next_task = poll_rand_task();
    kmt->spin_unlock(task_list_lk);
    cur_task = next_task;
    //     }
    //         break;
    //     default:
    //         break;
    // }
    LOG_INFO("scheduled to task: (%s)%p", cur_task->name, cur_task);
    return current[cpu]->context;
}

static void kmt_init() {
    for (int cpu = 0; cpu < cpu_count(); cpu++) {
        // init idle
        idle_task[cpu] = pmm->alloc(sizeof(task_t));
        task_t *task = idle_task[cpu];
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
        LOG_INFO("task init on CPU %d, name: %s, addr: %p, stack: %p", cpu, name, task, task->stack);
    }
    LIST_PTR_INIT(irq_t, irq_list);
    os->on_irq(INT_MIN, EVENT_NULL, kmt_context_save);
    os->on_irq(INT_MAX, EVENT_NULL, kmt_schedule);
    // LIST_PTR_INIT(task_t_ptr, task_list);
    task_list_lk = pmm->alloc(sizeof(spinlock_t));
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
    task_cnt++;
    if (task_cnt > MAX_TASK_NUM) {
        panic("too many tasks");
    }
    task_list[task_cnt - 1] = task;
    kmt->spin_unlock(task_list_lk);
    LOG_INFO("task created name: %s, entry: %p, addr: %p, stack: %p", name, entry, task, task->stack);
    return 0;
}

static void kmt_teardown(task_t *task) {
    //TODO: kmt teardown
    kmt->spin_lock(task_list_lk);
    pmm->free(task->stack);
    bool ok = false;
    for (int i = 0; i < task_cnt; i++) {
        if (task == task_list[i]) {
            ok = true;
            if (task_cnt > 1) { 
                task_list[i] = task_list[task_cnt - 1];
            }
            break;
        }
    }
    if (!ok) {
        panic("failed to teardown task");
    }
    task_cnt--;
    kmt->spin_unlock(task_list_lk);
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
