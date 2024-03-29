#include "uproc.h"
#include <assert.h>
#include <kmt.h>
#include <os.h>
#include <stdio.h>
#include <syscall.h>
#include <user.h>

#include "common.h"
#include "../initcode.inc"
#include "klib-macros.h"

pid_entry_t pinfo[UPROC_PID_NUM];

spinlock_t pid_lock;
spinlock_t sleep_lock;
spinlock_t refcnt_lock;

LIST_PTR_DEC(task_t_ptr, sleeping_tasks);

static int next_pid = 1;
static int *refcnt;

void init_refcnt() {
	int refsize = sizeof(int) * ((heap.end - heap.start) / PAGE_SIZE);
	refcnt = pmm->alloc(refsize);
	memset(refcnt, 0, refsize);
}

inline static int get_refcnt(void *pa) {
	int idx = (pa - heap.start) / PAGE_SIZE;
	return refcnt[idx];
}

inline static void inc_refcnt(void *pa) {
	int idx = (pa - heap.start) / PAGE_SIZE;
	++refcnt[idx];
	LOG_USER("%p(%d) %d -> %d", pa, idx, refcnt[idx] - 1, refcnt[idx]);
}

inline static void dec_refcnt(void *pa) {
	int idx = (pa - heap.start) / PAGE_SIZE;
	--refcnt[idx];
	LOG_USER("%p(%d) %d -> %d", pa, idx, refcnt[idx] + 1, refcnt[idx]);
}

static int pid_alloc() {
  kmt->spin_lock(&pid_lock);
  int pid = next_pid;
  panic_on(!pinfo[pid].valid, "NEXT_PID INVALID");
  pinfo[pid].valid = 0;
  for (next_pid = pid + 1; next_pid != pid; next_pid++) {
    if (pinfo[next_pid].valid) {
      break;
    }
    if (next_pid == UPROC_PID_NUM - 1)
      next_pid = 0;
  }
  panic_on(!pinfo[next_pid].valid, "UPROC PID NUM RUNNING OUT");
  kmt->spin_unlock(&pid_lock);
  return pid;
}

static Context *syscall_handler(Event ev, Context *context) {
  Context *syscall_context = context;
//   iset(true);
//   for (volatile int i = 1; i < 100000; i++);
  switch (syscall_context->GPRx) {
	case SYS_kputc: {
		syscall_context->GPRx = uproc->kputc(cur_task, syscall_context->GPR1); 
	} break;
	case SYS_fork: {
		syscall_context->GPRx = uproc->fork(cur_task); 
	} break;
	case SYS_wait: {
		syscall_context->GPRx = uproc->wait(cur_task, (int*)syscall_context->GPR1);
	} break;
	case SYS_exit: {
		syscall_context->GPRx = uproc->exit(cur_task, syscall_context->GPR1);	
	} break;
	case SYS_kill: {
		syscall_context->GPRx = uproc->kill(cur_task, syscall_context->GPR1);	
	} break;
	case SYS_mmap: {
		syscall_context->GPRx = (uint64_t)uproc->mmap(cur_task, (void*)syscall_context->GPR1, syscall_context->GPR2, syscall_context->GPR3, syscall_context->GPR4);
	} break;
	case SYS_getpid: {
		syscall_context->GPRx = uproc->getpid(cur_task); 
	} break;
	case SYS_sleep: {
		syscall_context->GPRx = uproc->sleep(cur_task, syscall_context->GPR1); 
	} break;
	case SYS_uptime: {
		syscall_context->GPRx = uproc->uptime(cur_task); 
	} break;
  }
//   iset(false);
  if (cur_task) {
	cur_task->context = syscall_context;
	if (cur_task != cur_last) { // deal with re-entry
		if (cur_last && cur_last != cur_task) {
			atomic_xchg(&cur_last->running, 0); // UNLOCK running
		}
		cur_last = cur_task;
	}
  }
  return NULL;
}

void pgnewmap(task_t *task, void *va, void *pa, int prot, int flags) {
    LOG_USER("%d[%s]: %p <- %p, (%d %d)", task->pid, task->name, va, pa, prot, flags);
	AddrSpace *as = &(task->as);
	int pid = task->pid;
	panic_on(pinfo[pid].mappings == 0, "invalid task mappings");
	pinfo[pid].mappings->push_back(pinfo[pid].mappings, (mapping_t){.va = va, .pa = pa, .prot = prot, .flags = flags});
	map(as, va, pa, prot);
	kmt->spin_lock(&refcnt_lock);
	inc_refcnt(pa);
	kmt->spin_unlock(&refcnt_lock);
	// LOG_USER("%d %d\n", pid, pinfo[pid].mappings->size);
}

void pgunmap(task_t *task, void *va) {
	AddrSpace *as = &(task->as);
	int pid = task->pid;
	panic_on(pinfo[pid].mappings == 0, "invalid task mappings");
	for_list(mapping_t, it, pinfo[pid].mappings) {
		if (it->elem.va == va) {
			void *pa = it->elem.pa;
    		LOG_USER("%d[%s]: %p </- %p", task->pid, task->name, va, pa);
			map(as, va, NULL, MMAP_NONE);
			kmt->spin_lock(&refcnt_lock);
			dec_refcnt(pa);
			kmt->spin_unlock(&refcnt_lock);
			pinfo[pid].mappings->remove(pinfo[pid].mappings, it);
			return;
		}
	}
	printf("cannot find va %p!\n");
	panic("pgunmap");
	// LOG_USER("%d %d\n", pid, pinfo[pid].mappings->size);
}

static Context *pagefault_handler(Event ev, Context *context) {
  // TODO: deal with COW
  AddrSpace *as = &(cur_task->as);
  int pg_mask = ~(as->pgsize - 1);
  void *pa = pmm->alloc(as->pgsize);
  void *va = (void *)(ev.ref & pg_mask);
//   LOG_USER("task: %s, %s, %d", cur_task->name, ev.msg, ev.cause);
//   LOG_USER("%p %p %p(%p)", as, pa, va, ev.ref);
  pgnewmap(cur_task, va, pa, PROT_READ | PROT_WRITE, MAP_PRIVATE);
  return NULL;
}

static inline size_t align(size_t size) {
  size--;
  size |= size >> 1;
  size |= size >> 2;
  size |= size >> 4;
  size |= size >> 8;
  size |= size >> 16;
  return size + 1;
}

void init_alloc(task_t *init_task) {
  AddrSpace *as = &(init_task->as);
  int pa_size = _init_len > as->pgsize ? align(_init_len) : as->pgsize;
  void *pa = pmm->alloc(pa_size);
  void *va = as->area.start;
  for (int offset = 0; offset < pa_size; offset += as->pgsize) {
    pgnewmap(init_task, va + offset, pa + offset, PROT_READ | PROT_WRITE, MAP_PRIVATE);
  }
  memcpy(pa, _init, _init_len);
  int pid = init_task->pid;
  panic_on(pid != 1, "init task pid not 1");
  pinfo[pid].mareas->push_back(pinfo[pid].mareas, (Area){.start = as->area.start + pa_size, .end = as->area.end});
  return;
}

task_t *new_task(pid_t ppid) {
  task_t *task = pmm->alloc(sizeof(task_t));
  int pid = pid_alloc();
  kmt_ucreate(task, "init", pid, ppid);
  LIST_PTR_INIT(mapping_t, pinfo[pid].mappings);
  LIST_PTR_INIT(Area, pinfo[pid].mareas);
  pinfo[pid].task = task;
  task->killed = 0;
  task->waiting = false;
  task->child_cnt = 0;
  return task;
}

static Context *error_handler(Event ev, Context *context) {
	panic(ev.msg);
	return NULL;
}

static Context *waker(Event ev, Context *context) {
	kmt->spin_lock(&sleep_lock);
	int64_t time = io_read(AM_TIMER_UPTIME).us / 1000;
	for_list(task_t_ptr, it, sleeping_tasks) {
		if (it->elem->waketime < time) {
			it->elem->status = RUNNABLE;
			task_t_ptr_list_node *new_it = it->next;
			sleeping_tasks->remove(sleeping_tasks, it);
			it = new_it;
			if (it == NULL) break;
		}
	}
	kmt->spin_unlock(&sleep_lock);
	return NULL;
}

void uproc_init() {
  vme_init((void *(*)(int))pmm->alloc, pmm->free);
  kmt->spin_init(&pid_lock, "pid lock");
  kmt->spin_init(&sleep_lock, "sleep lock");
  kmt->spin_init(&refcnt_lock, "refcnt lock");
  os->on_irq(0, EVENT_SYSCALL, syscall_handler);
  os->on_irq(0, EVENT_ERROR, error_handler);
  os->on_irq(0, EVENT_PAGEFAULT, pagefault_handler);
  os->on_irq(0, EVENT_NULL, waker);
  init_refcnt();
  LIST_PTR_INIT(task_t_ptr, sleeping_tasks);
  for (int i = 1; i < UPROC_PID_NUM; i++) {
    pinfo[i].valid = 1;
  }
  task_t *task = new_task(0);
  init_alloc(task);
  task->status = RUNNABLE;
//   panic_on(task->pid != 1, "first uproc id not 1");
//   task_t *task2 = new_task(0);
//   init_alloc(task2);
//   task2->status = RUNNABLE;
}

int uproc_kputc(task_t *task, char ch) {
  putch(ch); // safe for qemu even if not lock-protected
  return 0;
}

int uproc_fork(task_t *father) {
	// iset(false);
	LOG_USER("forking %d[%s]", father->pid, father->name);
	int ppid = father->pid;
	task_t *son = new_task(ppid);
	int pid = son->pid;
	son->name = father->name;
	father->child_cnt++;
	// memcpy(son->stack, father->stack, KMT_STACK_SIZE);
	uintptr_t rsp0 = son->context->rsp0;
	void *cr3 = son->context->cr3;
	memcpy(son->context, father->context, sizeof(Context));
	son->context->rsp0 = rsp0;
	son->context->cr3 = cr3;
	son->context->GPRx = 0;
	// LOG_USER("%p %p %p %p", son->stack, son->context->rsp, father->stack, father->context->rsp);

	AddrSpace *as = &(cur_task->as);
	int pgsize = as->pgsize;

	for_list(mapping_t, it, pinfo[ppid].mappings) {
		void *va = it->elem.va;
		void *fpa = it->elem.pa;
		if (it->elem.flags == MAP_SHARED) {
			// LOG_USER("shared %p %p %p", va, fpa, fpa);
			pgnewmap(son, va, fpa, it->elem.prot, it->elem.flags);
		}
		else if (it->elem.flags == MAP_PRIVATE){
			void *spa = pmm->alloc(pgsize);
			memcpy(spa, fpa, pgsize);
			// LOG_USER("private %p %p %p", va, fpa, spa);
			pgnewmap(son, va, spa, it->elem.prot, it->elem.flags);
		}
		else {
			printf("%d \n", it->elem.flags);
			panic("invalid mapping flags");
		}
	}

	for_list(Area, it, pinfo[ppid].mareas) {
		pinfo[pid].mareas->push_back(pinfo[pid].mareas, it->elem);
	}

	son->status = RUNNABLE;

	// iset(true);
	return pid;
}

int uproc_wait(task_t *task, int *status) {
	if (task->child_cnt == 0) return -1;
	else {
		task->waiting = 1;
		task->status = SLEEPING;
		yield();
	}
	int *status_pa = NULL;
	for_list(mapping_t, it, pinfo[task->pid].mappings) {
		void *va = it->elem.va;
		void *pa = it->elem.pa;
		if (va <= (void*)status && (void*)status < va + task->as.pgsize) {
			status_pa = pa + ((void*)status - va);
			break; 
		}
	}
	panic_on(status_pa == NULL, "invalid status");
	*status_pa = task->child_status;
	return 0;
}

int uproc_exit(task_t *task, int status) {
	// iset(false);
	kmt->spin_lock(&pid_lock);
	int pid = task->pid;
	pinfo[pid].valid = 1;
	// // replaced by ufree
	for_list(mapping_t, it, pinfo[pid].mappings) {
		void *pa = it->elem.pa;
		LOG_USER("%d[%s]: %p </- %p", task->pid, task->name, it->elem.va, pa);
		kmt->spin_lock(&refcnt_lock);
		dec_refcnt(pa);
		int pa_ref = get_refcnt(pa);
		if (pa_ref == 0) {
			pmm->free(pa);
		}
		if (pa_ref < 0){
			panic("page with refcnt < 0");
		}
		kmt->spin_unlock(&refcnt_lock);
		// ufree(pa);
	}
	pinfo[pid].mappings->clear(pinfo[pid].mappings);
	pinfo[pid].mareas->clear(pinfo[pid].mareas);
	// FIXME: orphan proc
	// printf("111 %d %d\n", task->ppid, pinfo[task->ppid].valid);
	if (!pinfo[task->ppid].valid) {
		task_t *father = pinfo[task->ppid].task;
		father->child_cnt--;
		if (father->waiting) {
			father->waiting = 0;
			father->status = RUNNABLE;
			father->child_status = status;
		}
	}
	// for (int i = 1; i < UPROC_PID_NUM; i++) { 
	// 	if (pinfo[i].valid && pinfo[i].ppid == pid) {
	// 		pinfo[i].ppid = 1; // TODO
	// 	}
	// }
	// TODO: wake up
	kmt->spin_unlock(&pid_lock);
	unprotect(&(task->as));
	kmt->teardown(task);
	// iset(true);
	return status;
}

int uproc_kill(task_t *task, int pid) {
	// iset(false);
	pinfo[pid].task->status = KILLED;
	// iset(true);
	return 0;
}

void *mmap_alloc(task_t *task, void *addr, int length) {
	int pid = task->pid;
	void *ans = (void*)(-1);
	for_list(Area, it, pinfo[pid].mareas) {
		if (it->elem.start >= addr && (it->elem.end - it->elem.start >= length)) {
			ans = it->elem.start;
			if (it->elem.end - it->elem.start == length) {
				pinfo[pid].mareas->remove(pinfo[pid].mareas, it);
			}
			else {
				it->elem.start += length;
			}
			break;
		}
	}
	return ans;
}

void* mmap_free(task_t *task, void *addr, int length) {
	int pid = task->pid;
	for_list(Area, it, pinfo[pid].mareas) {
		if (it->elem.start > addr + length) {
			pinfo[pid].mareas->insert_prev(pinfo[pid].mareas, it, (Area){.start = addr, .end = addr + length});
			return NULL;
		}
		if (it->elem.start == addr + length) {
			it->elem.start -= length;
			return NULL;
		}
		if (it->elem.end > addr) {
			return (void*)(-1);
		}
		if (it->elem.end == addr) {
			it->elem.end += length;
			for (Area_list_node *nd = it; nd != NULL && nd->elem.start == it->elem.end; ) {
				it->elem.end += nd->elem.end - nd->elem.start;
				Area_list_node *nxt = nd;
				pinfo[pid].mareas->remove(pinfo[pid].mareas, nd);
				nd = nxt;
			}
			return NULL;
		}
	}			
	pinfo[pid].mareas->push_back(pinfo[pid].mareas, (Area){.start = addr, .end = addr + length});
	return NULL;
}	

void *uproc_mmap(task_t *task, void *addr, int length, int prot, int flags) {
	// panic("TODO");
	int pgsize = task->as.pgsize;
	if (flags != MAP_UNMAP) {
		addr = (void*)ROUNDUP(addr, PAGE_SIZE);
		length = align(length);
		void *result = mmap_alloc(task, addr, length);
		LOG_USER("%p", result);
		if (result == (void*)(-1)) {
			return result;
		}
		else {
			for (void *va = result; va - result < length; va += pgsize) {
				void *pa = pmm->alloc(pgsize);
				pgnewmap(task, va, pa, prot, flags);
			}
		}
		LOG_USER("%p", result);
		return result;
	}
	else {
		void * addr_end = addr + length;
		addr = (void*)ROUNDDOWN(addr, PAGE_SIZE);
		addr_end = (void*)ROUNDUP(addr_end, PAGE_SIZE);
		void *result = mmap_free(task, addr, addr_end - addr);
		if (result == (void*)(-1)) {
			return result;
		}
		else {
			for (void *va = addr; va - addr < length; va += pgsize) {
				pgunmap(task, va);
			}
		}
	}
	return NULL;
}

int uproc_getpid(task_t *task) { 
	return task->pid; 
}

int uproc_sleep(task_t *task, int seconds) {
	kmt->spin_lock(&sleep_lock);
	int64_t time = io_read(AM_TIMER_UPTIME).us / 1000;
	time += seconds * 1000;
	task->waketime = time;
	task->status = SLEEPING;
	sleeping_tasks->push_back(sleeping_tasks, task);
	kmt->spin_unlock(&sleep_lock);

	yield();
	return 0;
}

int64_t uproc_uptime(task_t *task) {
	int64_t time = io_read(AM_TIMER_UPTIME).us / 1000;
  	return time;
}

MODULE_DEF(uproc) = {
    .init = uproc_init,
    .kputc = uproc_kputc,
	.fork = uproc_fork,
	.wait = uproc_wait,
	.exit = uproc_exit,
	.kill = uproc_kill,
	.mmap = uproc_mmap,
	.getpid = uproc_getpid,
	.sleep = uproc_sleep,
	.uptime = uproc_uptime,
};
