#include "uproc.h"
#include <os.h>
#include <syscall.h>

#include "initcode.inc"

pid_entry_t pid2task[UPROC_PID_NUM];

void uproc_init() {
	vme_init((void * (*)(int))pmm->alloc, pmm->free);
	// TODO: finish init
}

int uproc_kputc(task_t *task, char ch) {
  	putch(ch); // safe for qemu even if not lock-protected
  	return 0;
}

int uproc_getpid(task_t *task) {
	// TODO: set pid
	return task->pid;
}

MODULE_DEF(uproc) = {
	.init = uproc_init,
	.kputc = uproc_kputc,
};
