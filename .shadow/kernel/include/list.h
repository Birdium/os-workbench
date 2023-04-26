#ifndef LIST_H
#define LIST_H

#include <stddef.h>
#include <lock.h>

#include <stdlib.h>
#include <stdio.h>

#define DEF_LIST(type) \
    typedef struct type##_list_node { \
        type elem; \
        struct type##_list_node *prev; \
        struct type##_list_node *next; \
    } type##_list_node; \
    typedef struct type##_list type##_list; \
    struct type##_list { \
        struct type##_list_node *head, *tail; \
        void (*insert_prev) (type##_list *l, type##_list_node *p, type elem); \
        void (*insert_next) (type##_list *l, type##_list_node *p, type elem); \
        void (*push_front) (type##_list *l, type elem); \
        void (*push_back) (type##_list *l, type elem); \
        void (*remove) (type##_list *l, type##_list_node *p); \
        void (*pop_front) (type##_list *l); \
        void (*pop_back) (type##_list *l); \
    }; \
    static inline void type##_list_insert_prev(type##_list *l, type##_list_node *p, type elem) { \
        type##_list_node *q = malloc(sizeof(type##_list_node)); \
        q->elem = elem; \
        if (p == NULL) { \
            l->head = l->tail = q; \
            return ; \
        } \
        q->next = p; \
        q->prev = p->prev; \
        if (p->prev) { \
            p->prev->next = q; \
        } \
        else { \
            l->head = q; \
        } \
        p->prev = q; \
    } \
    static inline void type##_list_insert_next(type##_list *l, type##_list_node *p, type elem) { \
        type##_list_node *q = malloc(sizeof(type##_list_node)); \
        q->elem = elem; \
        if (p == NULL) { \
            l->head = l->tail = q; \
            return ; \
        } \
        q->prev = p; \
        q->next = p->next; \
        if (p->next) { \
            p->next->prev = q; \
        } \
        else { \
            l->tail = q; \
        } \
        p->next = q; \
    } \
    static inline void type##_list_push_front(type##_list *l, type elem) { \
        type##_list_insert_prev(l, l->head, elem); \
    } \
    static inline void type##_list_push_back(type##_list *l, type elem) { \
        type##_list_insert_next(l, l->tail, elem); \
    } \
    static inline void type##_list_remove(type##_list *l, type##_list_node *p) { \
        type##_list_node *prev = p->prev, *next = p->next; \
        if (p == l->head) l->head = next; \
        if (p == l->tail) l->tail = prev; \
        if (prev) prev->next = next; \
        if (next) next->prev = prev; \
        free(p); \
    } \
    static inline void type##_list_pop_front(type##_list *l) { \
        type##_list_remove(l, l->head); \
    } \
    static inline void type##_list_pop_back(type##_list *l) { \
        type##_list_remove(l, l->tail); \
    } \
    static inline type##_list *type##_list_init() { \
        type##_list *l = malloc(sizeof(type##_list)); \
        l->head = l->tail = NULL; \
        l->insert_prev = type##_list_insert_prev; \
        l->insert_next = type##_list_insert_next; \
        l->push_front = type##_list_push_front; \
        l->push_back = type##_list_push_back; \
        l->pop_front = type##_list_pop_front; \
        l->pop_back = type##_list_pop_back; \
        return l; \
    } \

#define LIST_INIT(type, l) \
    type##_list *l = type##_list_init()

#define foreach_list(type, it, list) \
    for (type##_list_node *it = (list)->head; it != NULL; it = it->next)
    
#endif