#include <am.h>
#include <klib.h>
#include <klib-macros.h>
#include <stdarg.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)


static char buf[4096];

typedef int _spinlock_t;
#define _SPIN_INIT() 0

static void _spin_lock(_spinlock_t *lk) {
  while (1) {
    intptr_t value = atomic_xchg(lk, 1);
    if (value == 0) {
      break;
    }
  }
}

static void _spin_unlock(_spinlock_t *lk) {
  atomic_xchg(lk, 0);
}

static _spinlock_t buf_lock = _SPIN_INIT();
static _spinlock_t printf_lock = _SPIN_INIT();

int printf(const char *fmt, ...) {
  char p_buf[1024];
  va_list ap;
  va_start(ap, fmt);
  int ret = vsprintf(p_buf, fmt, ap);
  va_end(ap);
  _spin_lock(&printf_lock);
  char *bp = p_buf;
  while(*bp != '\0') {
    putch(*bp); ++bp;
  }
  _spin_unlock(&printf_lock);
  return ret;
}

int vsprintf(char *out, const char *fmt, va_list ap) {
  int ret = vsnprintf(out, INT32_MAX, fmt, ap);
  return ret;
}

int sprintf(char *out, const char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);
  int ret = vsprintf(out, fmt, ap);
  va_end(ap);
  return ret;
}

int snprintf(char *out, size_t n, const char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);
  int ret = vsnprintf(out, n, fmt, ap);
  va_end(ap);
  return ret;
}

int vsnprintf(char *out, size_t n, const char *fmt, va_list ap) {
  size_t ch_num = 0;
  char *op = out; const char *fp = fmt;
  _spin_lock(&buf_lock);
  while(*fp != '\0' && ch_num < n) {
    if (*fp == '%'){
      ++fp;
      enum {no_fill, left_fill, right_fill} fill_type = no_fill;
      // enum {no_len, long_len} len_type = no_len; 
      char fill_ch = ' ';
      size_t width = 0; // precision = 0;
      // flag_characters
      bool flag = 1;
      while (flag){
        switch(*fp){
          case '-': fill_type = right_fill; break;
          case '0': 
            if (fill_type == no_fill) fill_type = left_fill;
            fill_ch = '0';
            break;
          default: flag = 0; break;
        }
        if (flag) ++fp;
      }
      // field width
      flag = 1;
      while (flag){
        switch(*fp){
          case'0': case'1': case'2': case'3': case'4': case'5': case'6': case'7': case'8': case'9':
            width = width * 10 + *fp - '0'; break;
          default: flag = 0; break;
        }
        if (flag) ++fp;
      }

      // switch (*fp){
      //   case 'l' : len_type = long_len; ++fp; break;
      //   default: break;
      // }

      size_t buf_len = 0;
      char *bp = buf;
      switch (*fp){
        case 'd': {
            // if (len_type == no_len){
            int arg = va_arg(ap, int);

            itoa(arg, buf, 10);
            // } else if (len_type == long_len){
            //   // int64_t arg = va_arg(ap, int);
            //   panic("length modifier to be done!");
            // }
            buf_len = strlen(buf);
          }
          break;
        case 'u': {
            unsigned arg = va_arg(ap, unsigned);
            uitoa(arg, buf, 10);
            buf_len = strlen(buf);
          }
          break;
        case 'x': case 'p': {
            unsigned arg = va_arg(ap, unsigned);
            uitoa(arg, buf, 16);
            buf_len = strlen(buf);
          }
          break;
        case 's': {
            char *arg = va_arg(ap, char*);
            strcpy(buf, arg);
            buf_len = strlen(buf) + 1;
          }
          break;
        case 'c': {
            char arg = va_arg(ap, int);
            *buf = arg; *(buf + 1) = '\0';
            buf_len = 2;
          }
          break;
        default:
          assert(0);
      }
      // printing from buf to out
      if (fill_type == left_fill){
        while(buf_len < width && ch_num < n){
          *op = fill_ch;
          ++op; ++ch_num; width--;
        }
      }
      while(*bp != '\0' && ch_num < n){
        *op = *bp;
        ++op; ++ch_num; ++bp;
      }
      if (fill_type == right_fill){
        while(buf_len < width && ch_num < n){
          *op = fill_ch;
          ++op; ++ch_num; width--;
        }
      }
    }
    else {
      *op = *fp;
      ++op; ++ch_num;
    }
    ++fp;
  }
  if (ch_num < n && *fp == '\0') {*op = '\0'; ++ch_num;}
  _spin_unlock(&buf_lock);
  return ch_num;
}

#endif
