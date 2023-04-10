#include <common.h>
#include <buddy.h>

static void os_init() {
  pmm->init();
}

static void *test_alloc(int size) {
  void *p = pmm->alloc(size);
#ifndef TEST
  printf("CPU #%d Allocating in %p, %d byte(s) (%x)\n", cpu_current(), p, size, size);
#else
  printf("CPU Allocating in %p, %d byte(s) (%x)\n", p, size, size);
#endif
  assert((size | ((uintptr_t)p == size + (uintptr_t)p)) || ((size-1) | (uintptr_t)p) == (size-1) + (uintptr_t)p);
  return p;
}

static void test_free(void *addr) {
  pmm->free(addr);
#ifndef TEST
  printf("CPU #%d Freeing in %p\n", cpu_current(), addr);
#else
  printf("CPU Freeing in %p\n", addr);
#endif
  buddy_debug_print();
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
  buddy_debug_print();
  printf("--------free-------\n");
  // void *p1 = test_alloc(1024);
  void *p2 = test_alloc(1024 * 1024);
  void *p3 = test_alloc(1024 * 1024);
  void *p4 = test_alloc(1024 * 1024);
  void *p5 = test_alloc(1024 * 1024 + 1);
  test_free(p2);
  test_free(p3); test_free(p4);
  test_free(p5); 
  // for (int i = 0; i <= 1000; i++) {
  //   size_t size = rand() % 100000;
  //   void *p = pmm->alloc(size);
  //   printf("CPU #%d Allocating in %x, %d byte(s) %x\n", cpu_current(), (uintptr_t)p, size, size);
  //   assert((size | ((uintptr_t)p == size + (uintptr_t)p)) || ((size-1) | (uintptr_t)p) == (size-1) + (uintptr_t)p);
  // }
  // size_t size = 16 * 1024 * 1024;
  // void *p = pmm->alloc(size);
  // printf("CPU #%d Allocating in %x, %d byte(s) %x\n", cpu_current(), (uintptr_t)p, size, size);
  buddy_debug_print();
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
