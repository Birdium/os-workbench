#include <stdlib.h>
#include <stdio.h>
#include <common.h>


enum ops { OP_ALLOC = 1, OP_FREE };

struct malloc_op random_op() {
    struct malloc_op result;
    result.type = OP_ALLOC;
    result.sz = 1024;
    return result;
}

struct malloc_op {
  enum ops type;
  union { size_t sz; void *addr; };
};

void stress_test() {
  while (1) {
    struct malloc_op op = random_op();
    switch (op.type) {
      case OP_ALLOC: alloc_check(pmm->alloc(op.sz), op.sz); break;
      case OP_FREE:  free(op.addr); break;
    }
  }
}

int main() {
  os->init();
}
