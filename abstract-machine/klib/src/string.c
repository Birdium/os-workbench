#include <klib.h>
#include <klib-macros.h>
#include <stdint.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

size_t strlen(const char *s) {
  size_t ans = 0;
  while(s[ans] != '\0') ans++;
  return ans;
}

char *strcpy(char *dst, const char *src) {
  size_t i = 0;
  while (src[i] != '\0'){
    dst[i] = src[i];
    i++;
  }
  dst[i] = '\0';
  return dst;
}

char *strncpy(char *dst, const char *src, size_t n) {
  // copied from man ^_^
  size_t i;
  for (i = 0; i < n && src[i] != '\0'; i++)
    dst[i] = src[i];
  for ( ; i < n; i++)
    dst[i] = '\0';
  return dst;
}

char *strcat(char *dst, const char *src) {
  //assert(0);
  size_t dst_len = strlen(dst);
  size_t i = 0;
  while(src[i] != '\0'){
    dst[dst_len + i] = src[i];
    i++;
  }
  dst[dst_len + i] = '\0';
  return dst;
}

int strcmp(const char *s1, const char *s2) {
  char const *p1 = s1; char const *p2 = s2;
  while(*p1 == *p2 && *p1 != '\0' && *p2 != '\0'){
    p1++; p2++;
  }
  return *p1 - *p2;
}

int strncmp(const char *s1, const char *s2, size_t n) {
  char const *p1 = s1; char const *p2 = s2; size_t i = 0;
  while(*p1 == *p2 && *p1 != '\0' && *p2 != '\0' && i != n){
    p1++; p2++; i++;
  }
  return *p1 - *p2;
}

void *memset(void *s, int c, size_t n) {
  char* sp = s;
  while(n--){
    *sp++ = c;
  }
  return s;
}

void *memmove(void *dst, const void *src, size_t n) {
  char* dp = dst;
  const char* sp = src;
  if (dp <= sp || dp >= sp + n){
    while(n--){
      *dp++ = *sp++;
    }
  }
  else {
    dp += n; sp += n;
    while(n--){
      *--dp = *--sp;
    }
  }
  return dst;
}

void *memcpy(void *out, const void *in, size_t n) {
  char* op = out;
  const char* ip = in;
  while(n--){
    *op++ = *ip++;
  }
  return out;
}

int memcmp(const void *s1, const void *s2, size_t n) {
  unsigned char const *p1 = s1; unsigned char const *p2 = s2; size_t i = 0;
  while(*p1 == *p2 && i != n){
    p1++; p2++; i++;
  }
  if (i == n) return 0;
  else return *p1 - *p2;
}

#endif
