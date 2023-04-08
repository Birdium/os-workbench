#include <common.h>
#include <buddy.h>
#ifndef TEST
#include <lock.h>
#endif

static inline size_t align(size_t size) {
  size--;
  size |= size >> 1;
  size |= size >> 2;
  size |= size >> 4;
  size |= size >> 8;
  size |= size >> 16;
  return size + 1;
}

spinlock_t lk;
uintptr_t pm_cur;

static void *kalloc(size_t size) {
  // if (size > (1<<24)) return NULL;
  spin_lock(&lk);
  uintptr_t pm_ret = ((pm_cur-1) & (-align(size))) + align(size);
  pm_cur = pm_ret + size;
#ifdef TEST
  printf("kalloc: allocated from %p, size %u\n", pm_ret, size);
#endif
  spin_unlock(&lk);
  return (void*) pm_ret;
}

static void kfree(void *ptr) {
}

#ifndef TEST
// 框架代码中的 pmm_init (在 AbstractMachine 中运行)
static void pmm_init() {
  uintptr_t pmsize = ((uintptr_t)heap.end - (uintptr_t)heap.start);
  printf("Got %d MiB heap: [%p, %p)\n", pmsize >> 20, heap.start, heap.end);
  lk = SPIN_INIT();
  pm_cur = (uintptr_t) heap.start;
  init_buddy();
}
#else
// 测试代码的 pmm_init ()
#define HEAP_SIZE (1 << 24)
static void pmm_init() {
  char *ptr  = malloc(HEAP_SIZE); 
  heap.start = ptr;
  heap.end   = ptr + HEAP_SIZE;
  printf("Got %d MiB heap: [%p, %p)\n", HEAP_SIZE >> 20, heap.start, heap.end);
}
#endif

MODULE_DEF(pmm) = {
  .init  = pmm_init,
  .alloc = kalloc,
  .free  = kfree,
};
