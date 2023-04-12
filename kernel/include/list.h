#ifndef LIST_H
#define LIST_H

#include <stddef.h>
#include <lock.h>

typedef struct {
    void *start;
    size_t size;
    Node *prev, *next;
} Node;

typedef struct {
    spinlock_t lock;
    Node *start, *end;
} List;

#endif