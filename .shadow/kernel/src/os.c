#include <common.h>

static void os_init() {
  pmm->init();
}

static void os_run() {
  // for (const char *s = "Hello World from CPU #*\n"; *s; s++) {
  //   putch(*s == '*' ? '0' + cpu_current() : *s);
  // }
  // printf("Hello World from CPU #%d\n", cpu_current());
  while (1) ;
}

MODULE_DEF(os) = {
  .init = os_init,
  .run  = os_run,
};
