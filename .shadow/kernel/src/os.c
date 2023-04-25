#include <common.h>
#include <buddy.h>

static void os_init() {
  pmm->init();
  kmt->init();
}

static void *test_alloc(int size) {
  void *p = pmm->alloc(size);
#ifndef TEST
  printf("CPU #%d Allocating in %p, %d byte(s) (%x)\n", cpu_current(), p, size, size);
#else
  // printf("CPU Allocating in %p, %d byte(s) (%x)\n", p, size, size);
#endif
  assert((size | ((uintptr_t)p == size + (uintptr_t)p)) || ((size-1) | (uintptr_t)p) == (size-1) + (uintptr_t)p);
  // assert(((uintptr_t)p & 0b1111) == 0);
  return p;
}

static void test_free(void *addr) {
  printf("CPU #%d Freeing in %p\n", cpu_current(), addr);
  assert(addr != NULL);
  pmm->free(addr);
#ifndef TEST
#else
  printf("CPU Freeing in %p\n", addr);
#endif
  // buddy_debug_print();
}

<<<<<<< HEAD
#ifndef TEST
static void os_run() {
  // for (const char *s = "Hello World from CPU #*\n"; *s; s++) {
  //   putch(*s == '*' ? '0' + cpu_current() : *s);
  // }
  iset(true);
  printf("Hello World from CPU #%d\n", cpu_current());
=======
static void test_pmm() {
>>>>>>> ead516d950a3d90c652c9761570593433d53690b
  test_alloc(1);
  test_alloc(2);
  test_alloc(4);
  test_alloc(8);
  void *p1 = test_alloc(1024 * 1024);
  void *p2 = test_alloc(1024 * 1024);
  void *p3 = test_alloc(1024 * 1024);
  void *p4 = test_alloc(1024 * 1024);
  void *p5 = test_alloc(1024 * 1024 + 1);
  // // buddy_debug_print();
  // printf("--------free-------\n");
  test_free(p1);
  test_free(p2);
  test_free(p3); 
  test_free(p4);
  test_free(p5);
  // typedef struct Task {
  //   void *alloc;
  //   int size;
  // } Task;
  // #define TEST_SIZE 10000
  // Task tasks[TEST_SIZE];
  // for (int i = 0; i < TEST_SIZE; i++) {
  //   tasks[i].size = (1 << (rand() % 20));
  //   tasks[i].alloc = test_alloc(tasks[i].size);
  //   // buddy_debug_print();
  //   // assert((size | ((uintptr_t)p == size + (uintptr_t)p)) || ((size-1) | (uintptr_t)p) == (size-1) + (uintptr_t)p);
  // }
  // for (int i = 0; i < TEST_SIZE; i++) {
  //   if (tasks[i].alloc)
  //   test_free(tasks[i].alloc);
  // }
  // size_t size = 16 * 1024 * 1024;
  // void *p = pmm->alloc(size);
  // printf("CPU #%d Allocating in %x, %d byte(s) %x\n", cpu_current(), (uintptr_t)p, size, size);
  // for (volatile int i = 0; i < 10000; i ++);
  printf("SUCCESS\n");
}

#ifndef TEST
static void os_run() {
  iset(true);
  printf("Hello World from CPU #%d\n", cpu_current());
  test_pmm();
  while (1) {
    // yield();
  }
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

Context *os_trap(Event ev, Context *context) {
  // TODO: os trap
  return NULL;
}

void os_on_irq(int seq, int event, handler_t handler) {
  // TODO: os on irq
}



MODULE_DEF(os) = {
  .init = os_init,
  .run  = os_run,
  .trap = os_trap,
  .on_irq = os_on_irq,
};
