#include <common.h>
#include <buddy.h>
#include <slab.h>
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

extern TableEntry *table;

// spinlock_t lk;
// uintptr_t pm_cur;

static void *kalloc(size_t size) {
  if (size > (1 << 24)) return NULL;
  if (size < 16) size = 16;
  // slow-path: buddy system
  if (size >= (1 << 12)) {
    return buddy_alloc(align(size));
  }
  else {
    return slab_alloc(align(size));
  }
  // // OJ hacker
  // spin_lock(&lk);
  // uintptr_t pm_ret = ((pm_cur-1) & (-align(size))) + align(size);
  // pm_cur = pm_ret + size;
// #ifdef TEST
  // printf("kalloc: allocated from %p, size %u\n", pm_ret, size);
// #endif
  // spin_unlock(&lk);
  // return (void*) pm_ret;
}

static void kfree(void *ptr) {
  TableEntry *tbe = ADDR_2_TBE(ptr);
  if (tbe->is_slab) slab_free(ptr);
  else buddy_free(ptr);
}

#ifndef TEST
// 框架代码中的 pmm_init (在 AbstractMachine 中运行)
static void pmm_init() {
  uintptr_t pmsize = ((uintptr_t)heap.end - (uintptr_t)heap.start);
  printf("Got %d MiB heap: [%p, %p)\n", pmsize >> 20, heap.start, heap.end);
  // lk = SPIN_INIT();
  // pm_cur = (uintptr_t) heap.start;
  init_buddy();
  slab_init();
}
#else
// 测试代码的 pmm_init ()
#define H_SIZE (1 << 25)
Area heap;
static void pmm_init() {
  char *ptr  = malloc(H_SIZE); 
  LOG_INFO("%p", ptr);
  heap.start = ptr;
  heap.end   = ptr + H_SIZE;
  printf("Got %d MiB heap: [%p, %p)\n", H_SIZE >> 20, heap.start, heap.end);
  init_buddy();
  buddy_debug_print();
  slab_init();
}
#endif

MODULE_DEF(pmm) = {
  .init  = pmm_init,
  .alloc = kalloc,
  .free  = kfree,
};
