#include <common.h>

static void os_init() {
  pmm->init();
}

#ifndef TEST
static void os_run() {
  // for (const char *s = "Hello World from CPU #*\n"; *s; s++) {
  //   putch(*s == '*' ? '0' + cpu_current() : *s);
  // }
  printf("Hello World from CPU #%d\n", cpu_current());
  for (int i = 0; i <= 1000; i++) {
    size_t size = rand() % 100000;
    void *p = pmm->alloc(size);
    printf("CPU #%d Allocating in %x, %d byte(s)\n", cpu_current(), (uintptr_t)p, size);
  }
  while (1);
}
#else 
static void os_run() {
  // for (const char *s = "Hello World from CPU #*\n"; *s; s++) {
  //   putch(*s == '*' ? '0' + cpu_current() : *s);
  // }
  printf("Testing\n");
  while (1) ;
}
#endif

MODULE_DEF(os) = {
  .init = os_init,
  .run  = os_run,
};
