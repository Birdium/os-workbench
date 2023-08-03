#include "uproc.h"
#include <assert.h>
#include <os.h>
#include <stdio.h>
#include <syscall.h>
#include <kmt.h>

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
		if (next_pid == UPROC_PID_NUM - 1) next_pid = 0;
	}
	panic_on(pinfo[next_pid].valid, "UPROC PID NUM RUNNING OUT");
	kmt->spin_unlock(&pid_lock);
	return pid;
}

void uproc_init() {
	vme_init((void * (*)(int))pmm->alloc, pmm->free);
	kmt->spin_init(&pid_lock, "pid lock");
	for (int i = 1; i < UPROC_PID_NUM; i++) {
		pinfo[i].valid = 0;
	}
	task_t *task = pmm->alloc(sizeof(task_t));
	int pid = pid_alloc(); 
	kmt_ucreate(task, "init", pid, 0);
	panic_on(pid != 1, "first uproc id not 1");
	// TODO: finish init
}

int uproc_kputc(task_t *task, char ch) {
  	putch(ch); // safe for qemu even if not lock-protected
  	return 0;
}

int uproc_getpid(task_t *task) {
	return task->pid;
}

MODULE_DEF(uproc) = {
	.init = uproc_init,
	.kputc = uproc_kputc,
};
