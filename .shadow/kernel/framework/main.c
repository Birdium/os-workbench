#include <kernel.h>
#include <klib.h>

int main() {
  ioe_init();
  assert(0);
  cte_init(os->trap);
  os->init();
  mpe_init(os->run);
  return 1;
}
