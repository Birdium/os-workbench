#include <common.h>

enum ops { OP_ALLOC = 1, OP_FREE };

struct malloc_op {
  enum ops type;
  union { size_t sz; void *addr; };
};

struct malloc_op random_op() {
    struct malloc_op result;
    result.type = OP_ALLOC;
    static int sz = 1024 * 1024 * 1024;
    result.sz = sz;
    return result;
}

void alloc_check(void *start, size_t sz) {
    // printf("allocated from %p, size %u\n", start, sz);
    return;
}

void stress_test() {
  while (1) {
    struct malloc_op op = random_op();
    switch (op.type) {
      case OP_ALLOC: alloc_check(pmm->alloc(op.sz), op.sz); break;
    //   case OP_FREE:  free(op.addr); break;
    }
  }
}

static void *test_alloc(int size) {
  void *p = pmm->alloc(size);
#ifdef DEBUG
  printf("CPU #%d Allocating in %p, %d byte(s) (%x)\n", cpu_current(), p, size, size);
#endif
  assert((size | ((uintptr_t)p == size + (uintptr_t)p)) || ((size-1) | (uintptr_t)p) == (size-1) + (uintptr_t)p);
  return p;
}

static void test_free(void *addr) {
  assert(addr != NULL);
  pmm->free(addr);
#ifdef DEBUG
  printf("CPU #%d Freeing in %p\n", cpu_current(), addr);
#endif
  // buddy_debug_print();
}

void test_test(int cpu_id) {
  #define TEST_SIZE 50000
  set_tid(cpu_id, pthread_self());
  typedef struct Task {
    void *alloc;
    int size;
  } Task;
  Task tasks[TEST_SIZE];
  for (int k = 0; k < 100; k++) {
  for (int i = 0; i < TEST_SIZE; i++) {
    tasks[i].size = (1 << (rand() % 20));
    tasks[i].alloc = test_alloc(tasks[i].size);
    // assert((size | ((uintptr_t)p == size + (uintptr_t)p)) || ((size-1) | (uintptr_t)p) == (size-1) + (uintptr_t)p);
  }
  for (int i = 0; i < TEST_SIZE; i++) {
    if (tasks[i].alloc)
    test_free(tasks[i].alloc);
  }
  }
  printf("SUCCESS!\n");
}

int main() {
  os->init();
  for (int i = 0; i < 4; i++) {
    create(test_test);
  }
}
