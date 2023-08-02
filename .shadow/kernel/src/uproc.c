#include <os.h>
#include <syscall.h>

#include "initcode.inc"

void init() {
	vme_init((void * (*)(int))pmm->alloc, pmm->free);
}

int kputc(task_t *task, char ch) {
  putch(ch); // safe for qemu even if not lock-protected
  return 0;
}

MODULE_DEF(uproc) = {
	.init = init,
	.kputc = kputc,
};
