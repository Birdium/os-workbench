#ifndef LIST_H
#define LIST_H

#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>

#ifdef TEST
#define LIST_ALLOC malloc
#define LIST_FREE free
#else 
#define LIST_ALLOC pmm->alloc
#define LIST_FREE pmm->free
#endif 

#define DEF_LIST(type) \
    typedef struct type##_list_node { \
        type elem; \
        struct type##_list_node *prev; \
        struct type##_list_node *next; \
    } type##_list_node; \
    typedef struct type##_list type##_list; \
    struct type##_list { \
        struct type##_list_node *head, *tail; \
		type##_list *self; \
        int size; \
        void (*insert_prev)	(type##_list *l, type##_list_node *p, type elem); \
        void (*insert_next)	(type##_list *l, type##_list_node *p, type elem); \
        void (*push_front)	(type##_list *l, type elem); \
        void (*push_back)	(type##_list *l, type elem); \
        void (*remove)		(type##_list *l, type##_list_node *p); \
        void (*pop_front)	(type##_list *l); \
        void (*pop_back)	(type##_list *l); \
		void (*free)		(type##_list *l); \
        type (*front)       (type##_list *l); \
        type (*back)        (type##_list *l); \
    }; \
    static inline void type##_list_insert_prev(type##_list *l, type##_list_node *p, type elem) { \
        ++l->size; \
        type##_list_node *q = LIST_ALLOC(sizeof(type##_list_node)); \
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
        ++l->size; \
        type##_list_node *q = LIST_ALLOC(sizeof(type##_list_node)); \
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
        --l->size; \
        type##_list_node *prev = p->prev, *next = p->next; \
        if (p == l->head) l->head = next; \
        if (p == l->tail) l->tail = prev; \
        if (prev) prev->next = next; \
        if (next) next->prev = prev; \
        LIST_FREE(p); \
    } \
    static inline type type##_list_front(type##_list *l) { \
        return l->head->elem; \
    } \
    static inline type type##_list_back(type##_list *l) { \
        return l->tail->elem; \
    } \
    static inline void type##_list_pop_front(type##_list *l) { \
        type##_list_remove(l, l->head); \
    } \
    static inline void type##_list_pop_back(type##_list *l) { \
        type##_list_remove(l, l->tail); \
    } \
	static inline void type##_list_free(type##_list *l) { \
		type##_list_node *p = l->head; \
		while (p) { \
			type##_list_node *q = p->next; \
			LIST_FREE(p); \
			p = q; \
		} \
		LIST_FREE(l); \
	} \
    static inline void type##_list_init(type##_list *l) { \
		l->self = l; \
        l->size = 0; \
        l->head = l->tail = NULL; \
        l->insert_prev	= type##_list_insert_prev; \
        l->insert_next	= type##_list_insert_next; \
        l->push_front	= type##_list_push_front; \
        l->push_back	= type##_list_push_back; \
        l->pop_front	= type##_list_pop_front; \
        l->pop_back 	= type##_list_pop_back; \
        l->remove       = type##_list_remove; \
		l->free 		= type##_list_free; \
        l->front        = type##_list_front; \
        l->back         = type##_list_back; \
    } \
    static inline type##_list *type##_list_new_init() { \
        type##_list *l = LIST_ALLOC(sizeof(type##_list)); \
        type##_list_init(l); \
        return l; \
    } \

#define LIST_DEC(type, l) \
    type##_list l

#define LIST_DEC_EXTERN(type, l) \
    extern LIST_DEC(type, l)

#define LIST_PTR_DEC(type, l) \
    type##_list *l

#define LIST_PTR_DEC_EXTERN(type, l) \
    extern LIST_PTR_DEC(type, l)

#define LIST_PTR_DEC_INIT(type, l) \
    type##_list *l = type##_list_new_init()

#define LIST_INIT(type, l) \
    type##_list_init(l)

#define LIST_PTR_INIT(type, l) \
    l = type##_list_new_init()

#define for_list(type, it, list) \
    for (type##_list_node *it = (list)->head; it != NULL; it = it->next)

#endif