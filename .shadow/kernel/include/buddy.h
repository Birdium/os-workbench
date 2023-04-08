#ifndef BUDDY_H
#define BUDDY_H
#include <common.h>
#include <stdio.h>
extern Area heap;

#define HEAP_SIZE (heap.end - heap.start)
#define PAGE_NUM (HEAP_SIZE / PAGE_SIZE);

void init_buddy();

#endif