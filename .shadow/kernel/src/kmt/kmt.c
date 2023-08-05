#include "am.h"
#include "common.h"
#include "klib-macros.h"
#include "list.h"
#include <assert.h>
#include <os.h>
#include <limits.h>
#include <kmt.h>
#include <stdio.h>

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
    panic_on(!cur_task, "no valid task");

    cur_task->context = context; 
    printf("task %d entered with type %d\n", cur_task->pid, ev.event);
    if (cur_last && cur_last != cur_task) {
        atomic_xchg(&cur_last->running, 0); // UNLOCK running
        printf("unlocked task %d\n", cur_last->pid);
    }
    cur_last = cur_task;
    return NULL;
}

static inline task_t *poll_rand_task() {
    task_t *result = cur_idle;
    if (task_cnt == 0) return result;  
    // rand version
    // static int cnt = 1;
    // if (cnt == 100000) {
    //     printf("[%d%d %p]", task_list[0]->running, task_list[1]->running, cur_task);
    //     cnt = 0;
    // }
    // cnt++;
    // if (task_list[0]->running == 1 && task_list[1]->running == 1) {
    //     printf("[11 %p]\n", cur_task);
    // }
    static const int round = 2; // choose task_cnt times for X round
    for (int i = 0; i < task_cnt * round; i++) {
        int idx = rand() % task_cnt;
        task_t *task = task_list[idx];
        if (task->status != SLEEPING && (task == cur_task || atomic_xchg(&task->running, 1) == 0)) { // atomic set task running 
            if (task != cur_task) {
                
        printf("locked task %d\n", cur_last->pid);
            }
            result = task;
            break;
        }
    }
    // // fixed version
    // for (int i = 0; i < task_cnt; i++) {
    //     if (task_list[i]->status != SLEEPING) {
    //         result = task_list[i]; break;
    //     }
    // }
    return result;
}

static Context *kmt_schedule(Event ev, Context *context) {
    task_t *prev_task = cur_task;
    panic_on(cur_task == NULL, "no available task");
    if (cur_task->status == KILLED) {
        uproc->exit(cur_task, 0);
    }
    // switch (ev.event) {
    //     case EVENT_YIELD: case EVENT_IRQ_TIMER: case EVENT_IRQ_IODEV:
    //     // schedule to other tasks
    //     {   
    // if (cur_task->status != SLEEPING) {
    //     if (cur_task != idle_task[cpu_current()]) {
    //         // task_list->push_back(task_list, cur_task);
    //     }
    // }
    cur_task = poll_rand_task();
    //     }
    //         break;
    //     default:
    //         break;
    // }
    // LOG_USER("scheduled from task %d to task %d, ctx %p", prev_task->pid, cur_task->pid, cur_task->context);
    printf("scheduled from task %d to task %d, ctx %p, %d\n", prev_task->pid, cur_task->pid, cur_task->context, ev.event);
    return cur_task->context;
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
        task->status = RUNNABLE;
        task->stack = pmm->alloc(KMT_STACK_SIZE);
        task->context = NULL;
        task->running = 1;
        task->canary = CANARY_NUM;
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
    task->running = 0;
    task->canary = CANARY_NUM;
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

int kmt_ucreate(task_t *task, const char *name, pid_t pid, pid_t ppid) {
    task->name = name;
    // if (runnable) {
    //     task->status = RUNNABLE;
    // }
    // else {
        task->status = SLEEPING;
    // }
    task->stack = pmm->alloc(KMT_STACK_SIZE);
    task->pid = pid;
    task->ppid = ppid;
    protect(&task->as);
    task->context = ucontext(
        &task->as,
        (Area){
            .start = task->stack, 
            .end = task->stack + KMT_STACK_SIZE
        }, task->as.area.start
    );
    task->running = 0;
    task->canary = CANARY_NUM;
    kmt->spin_lock(task_list_lk);
    task_cnt++;
    if (task_cnt > MAX_TASK_NUM) {
        panic("too many tasks");
    }
    task_list[task_cnt - 1] = task;
    kmt->spin_unlock(task_list_lk);
    LOG_INFO("utask created name: %s, area: [%p, %p), addr: %p, stack: %p", name, task->as.area.start, task->as.area.end, task, task->stack);
    return 0;
}

static void kmt_teardown(task_t *task) {
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
