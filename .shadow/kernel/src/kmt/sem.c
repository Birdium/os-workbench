#include "am.h"
#include "common.h"
#include "klib-macros.h"
#include "list.h"
#include "os.h"
#include <assert.h>
#include <kmt.h>

extern task_t *current[MAX_CPU_NUM];
extern spinlock_t *task_list_lk;
LIST_PTR_DEC_EXTERN(task_t_ptr, task_list);

void kmt_sem_init(sem_t *sem, const char *name, int value) {
	sem->name = name;
	sem->cnt = value;
	kmt->spin_init(&sem->lk, name);
	LIST_INIT(task_t_ptr, &sem->tasks);
}

void kmt_sem_signal(sem_t *sem) {
	kmt->spin_lock(&sem->lk);
	++sem->cnt;
	if (sem->tasks.size > 0) {
		int idx = rand() % sem->tasks.size;
		task_t_ptr_list_node *p = sem->tasks.head;
		for (int i = 0; i < idx; i++) {
			p = p->next;
		}
		task_t *ntask = p->elem;
		kmt->spin_lock(task_list_lk);
		LOG_INFO("%s %d %p %d", ntask->name, ntask->status, ntask, sem->tasks.size);
		LOG_INFO("%p %p %p %p %p %p", &sem->tasks, sem->tasks.head, sem->tasks.tail, p, p->prev, p->next);
		sem->tasks.remove(&(sem->tasks), p);
		panic_on(ntask->status != SLEEPING, "waiting task not sleeping");
		ntask->status = RUNNABLE;
		task_list->push_back(task_list, ntask);
		kmt->spin_unlock(task_list_lk);
	}
	kmt->spin_unlock(&sem->lk);
}

void kmt_sem_wait(sem_t *sem) {
	kmt->spin_lock(&sem->lk);
	--sem->cnt;
	if (sem->cnt < 0) {
		LOG_INFO("111");
		sem->tasks.push_back(&sem->tasks, current[cpu_current()]);		
		kmt->spin_unlock(&sem->lk);
		yield();
	}
	kmt->spin_unlock(&sem->lk);
}