#ifndef LIST_H
#define LIST_H

#include <stddef.h>
#include <lock.h>


#define LIST(type) \
    typedef struct type##_list_node { \
        type elem; \
        struct type##_list_node *prev; \
        struct type##_list_node *tail; \
    } type##_list_node; \
    typedef struct type##_list { \
        struct type##_list *head, *tail; \
        void (*insert_prev) (type##_list *l, type##_list_node *pos, type elem); \
        void (*insert_next) (type##_list *l, type##_list_node *pos, type elem); \
        void (*push_front) (type##_list *l, type elem); \
        void (*push_back) (type##_list *l, type elem); \
        void (*pop_front) (type##_list *l, type elem); \
        void (*pop_back) (type##_list *l, type elem); \
    } \
    static inline void type##_list_insert_prev(type##_list *l, type##_list_node *pos, type elem) { \
        type##list_node *q = malloc(sizeof(type##list_node)); \
        *q = elem; \
        if (pos == NULL) { \
            l->head = l->tail = q; \ 
            return ; \
        } \
        q->next = p; \
        q->prev = p->prev; \
        if (p->prev == NULL) { \
            p->prev->next = q; \
        } \
        else { \
            l->head = q; \
        } \
        p->prev = q; \
    } \
    static inline void type##_list_insert_next(type##_list *l, type##_list_node *pos, type elem) { \
        type##list_node *q = malloc(sizeof(type##list_node)); \
        *q = elem; \
        if (pos == NULL) { \
            l->head = l->tail = q; \ 
            return ; \
        } \
        q->prev = p; \
        q->next = p->next; \
        if (p->next == NULL) { \
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

#define for_list(type, it, list) \
    for (type##_list_node *it = (list).head; it != NULL; it = it->next);

#endif