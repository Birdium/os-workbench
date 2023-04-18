#include <kernel.h>
#include <klib.h>

int main() {
  ioe_init();
  cte_init(os->trap);
  assert(0);
  os->init();
  mpe_init(os->run);
  return 1;
}
