#include <common.h>

static void os_init() {
  pmm->init();
}

static void test_alloc(int size) {
  void *p = pmm->alloc(size);
  printf("CPU #%d Allocating in %x, %d byte(s) %x\n", cpu_current(), (uintptr_t)p, size, size);
  assert((size | ((uintptr_t)p == size + (uintptr_t)p)) || ((size-1) | (uintptr_t)p) == (size-1) + (uintptr_t)p);
}

#ifndef TEST
static void os_run() {
  // for (const char *s = "Hello World from CPU #*\n"; *s; s++) {
  //   putch(*s == '*' ? '0' + cpu_current() : *s);
  // }
  printf("Hello World from CPU #%d\n", cpu_current());
  test_alloc(1);
  test_alloc(2);
  test_alloc(4);
  test_alloc(8);
  test_alloc(1024);
  test_alloc(1024 * 1024);
  test_alloc(1024 * 1024);
  test_alloc(1024 * 1024);
  // for (int i = 0; i <= 1000; i++) {
  //   size_t size = rand() % 100000;
  //   void *p = pmm->alloc(size);
  //   printf("CPU #%d Allocating in %x, %d byte(s) %x\n", cpu_current(), (uintptr_t)p, size, size);
  //   assert((size | ((uintptr_t)p == size + (uintptr_t)p)) || ((size-1) | (uintptr_t)p) == (size-1) + (uintptr_t)p);
  // }
  // size_t size = 16 * 1024 * 1024;
  // void *p = pmm->alloc(size);
  // printf("CPU #%d Allocating in %x, %d byte(s) %x\n", cpu_current(), (uintptr_t)p, size, size);
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
