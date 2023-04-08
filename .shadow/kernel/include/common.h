#ifndef COMMON_H
#define COMMON_H

#include <kernel.h>
#include <klib.h>
#include <klib-macros.h>

#define ROUNDUP(a, sz)      ((((uintptr_t)a) + (sz) - 1) & ~((sz) - 1))
#define ROUNDDOWN(a, sz)    ((((uintptr_t)a)) & ~((sz) - 1))

#ifdef DEBUG
#define LOG_INFO(fmt, ...)  printf("LOG INFO: [%s][%d]"fmt"\n", __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else 
#define LOG_INFO(fmt, ...)  
#endif

#endif