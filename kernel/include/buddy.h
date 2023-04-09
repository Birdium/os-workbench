#ifndef BUDDY_H
#define BUDDY_H
#include <common.h>
#include <stdio.h>
#include "lock.h"

extern Area heap;

typedef struct TableEntry {
    struct TableEntry *prev, *next;
    uint8_t 
        size : 5,
        allocated: 1;
} TableEntry;

typedef struct {
    spinlock_t lock;
    TableEntry *head, *tail;
} TableList;


#define MAX_ALLOC_SIZE_EXP 24
#define MAX_ALLOC_SIZE (1 << MAX_ALLOC_SIZE_EXP)
#define PAGE_SIZE_EXP 12
#define PAGE_SIZE (1 << PAGE_SIZE_EXP)
#define MAX_ALLOC_PAGE_NUM MAX_ALLOC_SIZE / PAGE_SIZE
#define HEAP_SIZE (heap.end - heap.start)
#define PAGE_NUM (HEAP_SIZE / PAGE_SIZE)

#define ADDR_2_TBN(addr) (((void *)addr - heap.start) / PAGE_SIZE)
#define TBN_2_ADDR(tbn) (heap.start + PAGE_SIZE * tbn) 
#define TBE_2_ADDR(tbe) (heap.start + PAGE_SIZE * (tbe - table))

void init_buddy();
void buddy_insert(TableEntry *tbe);
void *buddy_get(size_t size);

#endif