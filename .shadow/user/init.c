#include "ulib.h"
#include <string.h>

void puti(int x) {
  char buf[10];
  for (int i = 0; i < 10; i++) {
    buf[i] = 0;
  }
  int idx = 0;
  while (x) {
    buf[idx++] = '0' + x % 10;
    x /= 10;
  }
  for (int j = idx - 1; j >= 0; j--) {
    kputc(buf[j]);
  }
}

void puti64(int64_t x) {
  char buf[10];
  for (int i = 0; i < 10; i++) {
    buf[i] = 0;
  }
  int idx = 0;
  while (x) {
    buf[idx++] = '0' + x % 10;
    x /= 10;
  }
  for (int j = idx - 1; j >= 0; j--) {
    kputc(buf[j]);
  }
}

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
  puti(p);
  kputc('\n');
  int64_t lt = 0;
  if (fork() == 0) {
    kputc('1');
  }
  else {
    kputc('2');
  }
  while(1){
    int64_t t = uptime();
    if (t - lt >= 1000) {
      puti64(t);
      lt = t;
      kputc(' ');
    }
  }
  return p;
}
