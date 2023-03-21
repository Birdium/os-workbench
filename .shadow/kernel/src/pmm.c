#include <common.h>
#include <lock.h>


static inline size_t align(size_t size) {
  size--;
  size |= size >> 1;
  size |= size >> 2;
  size |= size >> 4;
  size |= size >> 8;
  size |= size >> 16;
  return size + 1;
}

lock_t mutex;
uintptr_t pm_cur;

static void *kalloc(size_t size) {
  if (size >= (1<<24)) return NULL;
  lock(&mutex);
  uintptr_t pm_ret = ((pm_cur-1) & (-align(size))) + align(size);
  pm_cur = pm_ret + size;
  unlock(&mutex);
  return (void*) pm_ret;
}

static void kfree(void *ptr) {
}

static void pmm_init() {
  uintptr_t pmsize = ((uintptr_t)heap.end - (uintptr_t)heap.start);
  printf("Got %d MiB heap: [%p, %p)\n", pmsize >> 20, heap.start, heap.end);
}

MODULE_DEF(pmm) = {
  .init  = pmm_init,
  .alloc = kalloc,
  .free  = kfree,
};
