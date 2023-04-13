#include "slab.h"

extern TableEntry *table;

static SlabList slab[MAX_CPU_NUM][SLAB_NUM];

void slab_fetch_buddy(int slab_idx, int cpu) {
	LOG_INFO("fetching from buddy sys");
	void *addr_start = buddy_alloc(PAGE_SIZE * BUDDY_FETCH_PAGE_NUM);
	if (!addr_start) return;
	TableEntry *tbe = ADDR_2_TBE(addr_start);
	for (TableEntry *tbe_iter = tbe; tbe_iter < tbe + BUDDY_FETCH_PAGE_NUM; ++tbe_iter) {
		tbe_iter->size = IDX_2_SIZE_EXP(slab_idx);
		tbe_iter->is_slab = 1;
		tbe_iter->cpu_cnt = cpu;
	}
	void *addr_end = addr_start + PAGE_SIZE * BUDDY_FETCH_PAGE_NUM;
	LOG_INFO("SLAB fetch buddy from %p to %p", addr_start, addr_end);
	
	
	SlabList *list = &slab[cpu][slab_idx];
#ifndef TEST
	list->thread_lock = SPIN_INIT();
#else 
	pthread_mutex_init(&(list->thread_lock), NULL);
#endif
	list->thread.head = list->thread.tail = NULL;
	list->local.head = addr_start;
	SlabObj *iter = addr_start;
	while (iter != addr_end) {
		iter->prev = (iter == addr_start) ? NULL : iter - 1;
		iter->next = (iter == addr_end) ? NULL : iter + 1;
		++iter;
	}
	list->local.tail = iter - 1;
	list->local.cnt = PAGE_SIZE * BUDDY_FETCH_PAGE_NUM / IDX_2_SIZE_EXP(slab_idx);
	list->thread.cnt = 0;
}

// get some pages from buddy
void slab_init() {
	for (int cpu = 0; cpu < cpu_count(); cpu++) {
		// init each slab with size 8, 16, ... , 4096
		for (int slab_idx = 0; slab_idx < SLAB_NUM; slab_idx++) {
			// fecth page from buddy sys
			slab_fetch_buddy(slab_idx, cpu);
		}
	}
}

void slab_list_insert(SlabCacheList *list, SlabObj *obj) {
	if (list->tail == NULL) {
		list->head = list->tail = obj;
		obj->next = obj->prev = NULL;
	}
	else {
		list->tail->next = obj;
		obj->prev = list->tail;
		obj->next = NULL;
		list->tail = obj;
	}
	++list->cnt;
}

void *slab_list_poll(SlabCacheList *list) {
	SlabObj *result = NULL;
	if (list->head != NULL) {
		result = list->head;
		list->head = result->next;
		if (list->head) list->head->prev = NULL;
		result->next = NULL;
	}	
	--list->cnt;
	return result;
}

void *slab_alloc(size_t size) {
    int size_exp = PAGE_SIZE_EXP;
    while (size_exp < PAGE_SIZE_EXP && (1 << size_exp) != size) 
        ++size_exp;
    LOG_INFO("allocating 2^(%d) memory", size_exp);

	// first try local list
	int cpu = cpu_current();
	int slab_idx = SIZE_EXP_2_IDX(size_exp);
	SlabList *list = &slab[cpu][slab_idx];
	void *result = slab_list_poll(&(list->local));
	if (result) printf("%p\n", result);
	if (result) return result;

	// then try thread list
	spin_lock(&(list->thread_lock));
	result = slab_list_poll(&(list->thread));
	spin_unlock(&(list->thread_lock));
	if (result) return result;

	// finally requires buddy sys
	slab_fetch_buddy(slab_idx, cpu);
	result = slab_list_poll(&(list->local));
	return result;
}

void slab_free(void *addr) {
	TableEntry *tbe = ADDR_2_TBE(addr);
	// local list
	int size_exp = tbe->size;
	int slab_idx = SIZE_EXP_2_IDX(size_exp);
	int cpu = tbe->cpu_cnt;
	SlabList *list = &slab[cpu][slab_idx];
	if (cpu == cpu_current()) {
		slab_list_insert(&(list->local), addr);
	}
	else {
		spin_lock(&(list->thread_lock));
		slab_list_insert(&(list->thread), addr);
		spin_unlock(&(list->thread_lock));
	}
}