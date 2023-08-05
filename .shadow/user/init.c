#include "ulib.h"
#include <string.h>

int main() {
  // Example:
  kputc('H');
  kputc('e');
  kputc('l');
  kputc('l');
  kputc('o');
  kputc(',');
  kputc(' ');
  kputc('w');
  kputc('o');
  kputc('r');
  kputc('l');
  kputc('d');
  kputc('!');
  kputc('\n');
  int p = getpid();
  char buf[10];
  memset(buf, 0, sizeof(buf));
  int m = 1;
  for (int q = p; q != 0; q /= 10) {
    m *= 10;
  }
  for (int n = m; n != 0; n /= 10, p /= 10) {
    kputc('0' + p / (n / 10));
  }
  while(1){
    uptime();
  }
  return p;
}
