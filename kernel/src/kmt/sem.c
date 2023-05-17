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
	LOG_INFO("sem inited (%s)%p %d", name, sem, value);
	sem->name = name;
	sem->cnt = value;
	kmt->spin_init(&sem->lk, name);
	LIST_INIT(task_t_ptr, &sem->tasks);
}

void kmt_sem_signal(sem_t *sem) {
	kmt->spin_lock(&sem->lk);
	++sem->cnt;
	LOG_INFO("(%s)%p: %d -> %d", sem->name, sem, sem->cnt - 1, sem->cnt);
	if (sem->tasks.size > 0) {
		// int idx = rand() % sem->tasks.size;
		task_t_ptr_list_node *p = sem->tasks.head;
		// for (int i = 0; i < idx; i++) {
		// 	p = p->next;
		// }
		task_t *ntask = p->elem;
		// for_list(task_t_ptr, it, &sem->tasks) {
		// 	LOG_INFO("%s %s %d", sem->name, it->elem->name, it->elem->status);
		// 	panic_on(it == it->next, "it == it->next");
		// }
		sem->tasks.remove(&(sem->tasks), p);
		LOG_INFO("sem waked up task %s, %d", ntask->name, ntask->status);
		panic_on(ntask->status != SLEEPING, "waiting task not sleeping");
		kmt->spin_lock(task_list_lk);
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
		sem->tasks.push_back(&sem->tasks, current[cpu_current()]);		
		LOG_INFO("sem sleeped task: %s, cnt %d", current[cpu_current()]->name, sem->cnt);

		kmt->spin_lock(task_list_lk);
		cur_task->status = SLEEPING;
		kmt->spin_unlock(task_list_lk);
		
		// for_list(task_t_ptr, it, &sem->tasks) {
		// 	LOG_INFO("%s %s %d %p", sem->name, it->elem->name, it->elem->status, it->elem);
		// 	panic_on(it == it->next, "it == it->next");
		// }


		kmt->spin_unlock(&sem->lk);
		
		yield();		
	}
	else {
		kmt->spin_unlock(&sem->lk);
	}
}