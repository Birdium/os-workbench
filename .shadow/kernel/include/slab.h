#ifndef SLAB_H
#define SLAB_H
#include <common.h>
#include <lock.h>
#include <buddy.h>

typedef struct SlabObj {
	void *prev, *next;
} SlabObj;

typedef struct SlabCacheList {
	SlabObj *head, *tail;
	int cnt;
} SlabCacheList;

typedef struct SlabList {
	SlabCacheList local, thread;
	myspinlock_t thread_lock;
} SlabList;

// WARN: fatal error if size(SlabObj) > 16


#define MIN_CACHE_SIZE_EXP 4
#define MAX_CACHE_SIZE_EXP 12
#define SLAB_NUM (MAX_CACHE_SIZE_EXP - MIN_CACHE_SIZE_EXP + 1)
#define CACHE_SIZE(slab_cnt) (1 << (slab_cnt + MIN_CACHE_SIZE_EXP))
#define BUDDY_FETCH_PAGE_NUM 4
#define IDX_2_SIZE_EXP(idx) (idx + MIN_CACHE_SIZE_EXP)
#define SIZE_EXP_2_IDX(size_exp) (size_exp - MIN_CACHE_SIZE_EXP)

void slab_fetch_buddy(int slab_idx, int cpu);
void slab_init();
void *slab_alloc(size_t size);
void slab_free(void *addr);
void slab_list_insert(SlabCacheList *list, SlabObj *obj);

#endif