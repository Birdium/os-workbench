#ifndef COMMON_H
#define COMMON_H

#include <kernel.h>
#include <klib.h>
#include <klib-macros.h>


#define ROUNDUP(a, sz)      ((((uintptr_t)a) + (sz) - 1) & ~((sz) - 1))
#define ROUNDDOWN(a, sz)    ((((uintptr_t)a)) & ~((sz) - 1))

#define MAX_CPU_NUM 8

#define MAX_ALLOC_SIZE_EXP 24
#define MAX_ALLOC_SIZE (1 << MAX_ALLOC_SIZE_EXP)
#define PAGE_SIZE_EXP 12
#define PAGE_SIZE (1 << PAGE_SIZE_EXP)
#define MAX_ALLOC_PAGE_NUM MAX_ALLOC_SIZE / PAGE_SIZE
#define HEAP_SIZE (heap.end - heap.start)
#define PAGE_NUM (HEAP_SIZE / PAGE_SIZE)

// convert table entry's addr from the chunk's physical addr
#define ADDR_2_TBN(addr) (((void *)addr - heap.start) / PAGE_SIZE)
#define ADDR_2_TBE(addr) (table + ((void *)addr - heap.start) / PAGE_SIZE)
#define TBN_2_ADDR(tbn) (heap.start + PAGE_SIZE * tbn) 
#define TBE_2_ADDR(tbe) (heap.start + PAGE_SIZE * (tbe - table))

#define SIBLING_ADDR(tbe) ((void*)(((uintptr_t) TBE_2_ADDR(tbe)) ^ (1 << tbe->size)))
#define SIBLING_TBE(tbe) (ADDR_2_TBE(SIBLING_ADDR(tbe)))

#define PARENT_ADDR(tbe) ((void*)(((uintptr_t) TBE_2_ADDR(tbe)) & (~(1 << tbe->size))))
#define PARENT_TBE(tbe) (ADDR_2_TBE(PARENT_ADDR(tbe)))

#define RIGHT_SON_ADDR(tbe) ((void*)(((uintptr_t) TBE_2_ADDR(tbe)) | (1 << tbe->size)))
#define RIGHT_SON_TBE(tbe) (ADDR_2_TBE(RIGHT_SON_ADDR(tbe)))


#ifdef DEBUG 
#define LOG_INFO(fmt, ...)  printf("\033[1;34mLOG_INFO CPU #%d @ [%s][%d]: "fmt"\n\33[0m", cpu_current(), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define LOG_LOCK(fmt, ...)  
//printf("\033[1;31mLOG_LOCK CPU #%d @ [%s][%d]: "fmt"\n\33[0m", cpu_current(), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define LOG_INFO(fmt, ...)  
#define LOG_LOCK(fmt, ...)  

#endif

#ifdef TRACE_F
  #define TRACE_ENTRY printf("[trace] %s:entry\n", __func__)
  #define TRACE_EXIT printf("[trace] %s:exit\n", __func__)
#else
  #define TRACE_ENTRY ((void)0)
  #define TRACE_EXIT ((void)0)
#endif

#endif