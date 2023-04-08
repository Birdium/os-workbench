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

static inline void list_insert(List *list, Node *node, Node *dest) {
    spin_lock(&(list->lock));
    Node *cur = list->start;
    if (cur == NULL) {
        cur = 
    }
    spin_unlock(&(list->lock));
}

#endif