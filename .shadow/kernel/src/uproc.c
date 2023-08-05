#include "uproc.h"
#include <assert.h>
#include <kmt.h>
#include <os.h>
#include <stdio.h>
#include <syscall.h>

#include "common.h"
#include "initcode.inc"
#include "klib-macros.h"

pid_entry_t pinfo[UPROC_PID_NUM];

spinlock_t pid_lock;

static int next_pid = 1;

static int pid_alloc() {
  kmt->spin_lock(&pid_lock);
  int pid = next_pid;
  panic_on(pinfo[pid].valid, "NEXT_PID INVALID");
  pinfo[pid].valid = 0;
  for (next_pid = pid + 1; next_pid != pid; next_pid++) {
    if (pinfo[next_pid].valid) {
      break;
    }
    if (next_pid == UPROC_PID_NUM - 1)
      next_pid = 0;
  }
  panic_on(pinfo[next_pid].valid, "UPROC PID NUM RUNNING OUT");
  kmt->spin_unlock(&pid_lock);
  return pid;
}

static Context *syscall_handler(Event ev, Context *context) {
  // TODO: deal with syscall
  LOG_INFO("%d", ienabled());
  switch (context->GPRx) {
	case SYS_kputc: {
		context->GPRx = uproc->kputc(cur_task, context->GPR1); 
	} break;
	case SYS_fork: {
		context->GPRx = uproc->fork(cur_task); 
	} break;
	case SYS_wait: {
		
	} break;
	case SYS_exit: {
		
	} break;
	case SYS_kill: {
		
	} break;
	case SYS_mmap: {
		
	} break;
	case SYS_getpid: {
		context->GPRx = uproc->getpid(cur_task); 
	} break;
	case SYS_sleep: {
		context->GPRx = uproc->sleep(cur_task, context->GPR1); 
	} break;
	case SYS_uptime: {
		// context->GPRx = uproc->uptime(cur_task); 
	} break;
  }
  return NULL;
}

static Context *pagefault_handler(Event ev, Context *context) {
  // TODO: deal with COW
  AddrSpace *as = &(cur_task->as);
  int pg_mask = ~(as->pgsize - 1);
  void *pa = pmm->alloc(as->pgsize);
  void *va = (void *)(ev.ref & pg_mask);
  LOG_USER("task: %s, %s, %d\n", cur_task->name, ev.msg, ev.cause);
  LOG_USER("%p %p %p(%p)\n", as, pa, va, ev.ref);
  map(as, va, pa, MMAP_READ | MMAP_WRITE);
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
  int pa_size = _init_len > as->pgsize ? _init_len : as->pgsize;
  void *pa = pmm->alloc(pa_size);
  void *va = as->area.start;
  for (int offset = 0; offset < align(_init_len); offset += as->pgsize) {
    printf("%s: %p <- %p, PROT: %d\n", init_task->name, va + offset,
           pa + offset, MMAP_READ | MMAP_WRITE);
    map(as, va + offset, pa + offset, MMAP_READ | MMAP_WRITE);
  }
  memcpy(pa, _init, _init_len);
  return;
}

void uproc_init() {
  vme_init((void *(*)(int))pmm->alloc, pmm->free);
  kmt->spin_init(&pid_lock, "pid lock");
  os->on_irq(0, EVENT_SYSCALL, syscall_handler);
  os->on_irq(0, EVENT_PAGEFAULT, pagefault_handler);
  for (int i = 1; i < UPROC_PID_NUM; i++) {
    pinfo[i].valid = 0;
  }
  task_t *task = pmm->alloc(sizeof(task_t));
  int pid = pid_alloc();
  kmt_ucreate(task, "init", pid, 0);
  init_alloc(task);
  panic_on(pid != 1, "first uproc id not 1");
  LOG_INFO("%p", task->context->rsp);
  // TODO: finish init
}

int uproc_kputc(task_t *task, char ch) {
  putch(ch); // safe for qemu even if not lock-protected
  return 0;
}

int uproc_fork(task_t *task) {
	panic("TODO");
	return 0;
}

int uproc_wait(task_t *task, int *status) {
	panic("TODO");
	return 0;
}

int uproc_exit(task_t *task, int status) {
	panic("TODO");
	return 0;
}

int uproc_kill(task_t *task, int pid) {
	panic("TODO");
	return 0;
}

void *uproc_mmap(task_t *task, void *addr, int length, int prot, int flags) {
	panic("TODO");
	return NULL;
}

int uproc_getpid(task_t *task) { 
	return task->pid; 
}

int uproc_sleep(task_t *task, int seconds) {
	panic("TODO");
	return 0;
}
int64_t uproc_uptime(task_t *task) {
	int64_t time = io_read(AM_TIMER_UPTIME).us / 1000;
	printf("%p\n", time);
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
