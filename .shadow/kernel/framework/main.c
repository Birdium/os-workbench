#include <kernel.h>
#include <klib.h>

int main() {
	vme_init((void * (*)(int))pmm->alloc, pmm->free);
  ioe_init();
  cte_init(os->trap);
  os->init();
  mpe_init(os->run);
  return 1;
}
