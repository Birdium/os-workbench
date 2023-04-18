#ifndef BUDDY_H
#define BUDDY_H
#include <common.h>
#include <stdio.h>
#include "lock.h"

typedef struct TableEntry {
    struct TableEntry *prev, *next;
    uint8_t 
        size : 5,
        allocated: 1,
        is_slab : 1;
    uint8_t cpu_cnt;
    myspinlock_t lock;
} TableEntry;

typedef struct {
    myspinlock_t lock;
    TableEntry *head, *tail;
} TableList;

#ifdef TEST

extern Area heap;

#endif


void init_buddy();
void buddy_insert(TableEntry *tbe);
void buddy_delete(TableEntry *tbe);
void *buddy_alloc(size_t size);
void buddy_free(void *addr);
void *buddy_fetch_best_chunk(int exp);
void buddy_debug_print();

#endif