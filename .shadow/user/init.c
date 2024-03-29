#include "ulib.h"
#include <string.h>

int a;

void puts(char *s) {
  while (*s) {
    kputc(*s);
    s++;
  }
  kputc('\n');
}

void puti(int x) {
  if (x == 0) {
    kputc('0');
    return;
  }
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
  if (x == 0) {
    kputc('0');
    return;
  }
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

int helloworld() {
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
  return 0;
}

int gvartest() {
  puts("gvartest");
  if (fork() == 0) {
    sleep(1);
    kputc('0'+ a);
    exit(1);
  }
  else {
    a = 1;
    int res;
    wait(&res);
    kputc('\n');
  }
  return 0;
}

int forktest() {
  // Example:
  // int fk = 
  puts("forktest");
  fork();
  // kputc('0' + fk);
  int fk2 = fork();
  // kputc('0' + fk2);
  // kputc('\n');
  
  if (fk2) {
    int p = getpid();
    kputc('0' + p);
    int res = 10;
    // int ret = 
    wait(&res);
  }
  else {
    sleep(1);
    exit(5);
  }
  // if (fk == 0) {
  //   sleep(1);
  // }
  // else {
  //   sleep(10);
  // }
  // int64_t lt = 0;
  // while(1){
  //   int64_t t = uptime();
  //   if (t - lt >= 100) {
  //     // puti(p);
  //     lt = t;
  //     // if (fk && t / 100 == 10) {
  //     //   kill(fk);
  //     // }
  //   }
  // }
  return 0;
}

int mmaptest() {
  puts("mmaptest");
  int length = 8192;
  char *addr = mmap(NULL, length, PROT_READ | PROT_WRITE, MAP_PRIVATE);
  for (int i = 0; i < length; i++) {
    *(addr + i) = 'a';
  }
  int pid = fork();
  int res = 0;
  if (pid == 0) {
    *addr = 'b';
    sleep(3);
    exit(1);
  }
  else {
    wait(&res);
    kputc(*addr);
    if (res != 1) {
      kputc('W');
    }
    else {
      kputc('A');
    }
  }
  return 1;
}

int munmaptest() {
  puts("munmaptest");
  int length = 8192 + 4096;
  char *addr = mmap(NULL, length, PROT_READ | PROT_WRITE, MAP_PRIVATE);
  char *un = mmap(addr + 4096, 4096, PROT_READ | PROT_WRITE, MAP_UNMAP);
  if (un != 0) {
    while (1) {
      kputc('W');
    }
  }
  *(addr) = 'A';
  *(addr + 8192) = 'A';
  return 1;
}

int main() {
  // helloworld();
  gvartest();
  forktest();
  mmaptest();
  munmaptest();
  // ...
  return 0;
}