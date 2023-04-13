#include "buddy.h"

// table is a bitmap maintains the mapping to buddy system's addrspace 
// mem layout now:
// [heap] = [table, buddy]
// TODO: implement slab
TableEntry *table, *buddy_start;

// buddy is a static array with buddy[i] indicating to size (2^i)'s 
// page's array

static TableList buddy[32];


void init_buddy() {
    table = heap.start;
    buddy_start = (TableEntry *)ROUNDUP(table + PAGE_NUM, MAX_ALLOC_SIZE);
    int buddy_page = ADDR_2_TBN(buddy_start);
    // init buddy list
    memset(buddy, 0, sizeof(buddy));
    // init all table and insert them into buddy sys
    for (int i = buddy_page; i < PAGE_NUM; i += MAX_ALLOC_PAGE_NUM) {
        LOG_INFO("%p", &table[i]);
        table[i].size = MAX_ALLOC_SIZE_EXP;
        table[i].allocated = 0;
        table[i].is_slab = 0;
        buddy_insert(&table[i]);
        // table[i].prev = (i != buddy_page) ? NULL : &table[i - MAX_ALLOC_PAGE_NUM];
        // table[i].next = (i != PAGE_NUM) ? NULL : &table[i + MAX_ALLOC_PAGE_NUM];
    }
    // buddy[MAX_ALLOC_SIZE_EXP] = buddy_start;
    LOG_INFO("buddy system allocated from %p to %p", buddy_start, heap.end);
}

// should require lock outside this func
void buddy_insert(TableEntry *tbe) {
    int sz = tbe->size;
    assert(sz >= PAGE_SIZE_EXP);
    TableList *list = &buddy[sz];
    if (list->head == NULL) {
        list->head = list->tail = tbe;
        tbe->prev = tbe->next = NULL;
    }
    else {        
        list->tail->next = tbe;
        tbe->prev = list->tail;
        tbe->next = NULL;
        list->tail = tbe;
    }
    LOG_INFO("inserting %p into buddy #%d", TBE_2_ADDR(tbe), sz);
}

// should require lock outside this func
void buddy_delete(TableEntry *tbe) {
    int sz = tbe->size;
    assert(sz >= PAGE_SIZE_EXP);
    TableList *list = &buddy[sz];
    LOG_INFO("Deleting %p, size %d", TBE_2_ADDR(tbe), (1 << tbe->size));
    if (list->head && list->tail) {
        
    }
    else {
        printf("lits: %p\n", list);
        list = NULL;
        list->head = NULL; 
    }
    assert(list->head && list->tail);
    if (list->head == list->tail) {
        assert(list->head == tbe);
        list->head = list->tail = NULL;
    }
    else if (list->head == tbe) {
        list->head = tbe->next;
        list->head->prev = NULL;
        if (list->head) {
            if (list->head->size < PAGE_SIZE_EXP) {
                TableEntry *iter = list->head;
                int cnt1 = 0;
                while (iter) {
                    cnt1++;
                    printf("[%p, %p)", TBE_2_ADDR(iter), TBE_2_ADDR(iter) + (1 << iter->size));
                    if (iter == list->tail) break;
                    printf(" <-> ");
                    iter = iter->next;
                    if (cnt1 > 5) break;
                }
                printf("\n");
            }
            if (list->head->size < PAGE_SIZE_EXP) {
                list = NULL;
                list->head = NULL; 
            }
        }
    }
    else if (list->tail == tbe) {
        list->tail = tbe->prev;
        list->tail->next = NULL;
    }
    if (tbe->prev) tbe->prev->next = tbe->next;
    if (tbe->next) tbe->next->prev = tbe->prev;
    tbe->prev = tbe->next = NULL;
    if (list->head) assert(list->head->size >= PAGE_SIZE_EXP);
}

// get a smallest chunk whose size >= 2^(exp)
// remove it's tbe from buddy system and return the physical addr  
// shall hold lock for the return chunk's list
void *buddy_fetch_best_chunk(int exp) {
    void *chunk = NULL;
    while (exp <= MAX_ALLOC_SIZE_EXP) {
        TableList *list = &buddy[exp];

        LOG_LOCK("trying to fetch %d", list - buddy);
        spin_lock(&(list->lock));
        LOG_LOCK("fetched %d", list - buddy);

        if (list->head != NULL) {
            TableEntry *tbe = list->head;
            spin_lock(&(tbe->lock));
            chunk = TBE_2_ADDR(tbe);
            assert(tbe->allocated == 0);
            tbe->allocated = 1;
            buddy_delete(tbe);
            spin_unlock(&(tbe->lock));
        }

        spin_unlock(&(list->lock));
        LOG_LOCK("released %d", list - buddy);

        if (chunk) break;
        ++exp;
    } 
    return chunk;
}

// just an allocator
void *buddy_alloc(size_t size) {
    // assume alloc is aligned
    int size_exp = PAGE_SIZE_EXP;
    while (size_exp < MAX_ALLOC_SIZE_EXP && (1 << size_exp) != size) 
        ++size_exp;
    LOG_INFO("allocating 2^(%d) memory", size_exp);
    void *result = buddy_fetch_best_chunk(size_exp);
    if (result == NULL) return NULL;
    TableEntry *tbe = ADDR_2_TBE(result);
    LOG_INFO("fetched page start from %p with size %d", result, (1<<tbe->size));
    // split tbe into 2
    while (1) {
        spin_lock(&(tbe->lock));
        if (tbe->size <= size_exp) {
            spin_unlock(&(tbe->lock));
            break;
        }
        tbe->size--;
        int sz = tbe->size;
        spin_unlock(&(tbe->lock));
        assert(sz >= PAGE_SIZE_EXP);
        // get the list wait to be insert
        TableList *list = &buddy[sz];

        LOG_LOCK("trying to fetch %d", list - buddy);
        spin_lock(&(list->lock));
        LOG_LOCK("fetched %d", list - buddy);

        TableEntry *split_tbe = tbe + (1 << (sz - PAGE_SIZE_EXP));
        LOG_INFO("splitting %p with size %d", TBE_2_ADDR(split_tbe), 1 << sz);

        spin_lock(&(split_tbe->lock));
        split_tbe->cpu_cnt = cpu_current();
        split_tbe->is_slab = 0;
        split_tbe->size = sz;
        split_tbe->allocated = 0;
        spin_unlock(&(split_tbe->lock));

        buddy_insert(split_tbe);

        spin_unlock(&(list->lock));
        LOG_LOCK("released %d", list - buddy);
    }
    if ((uintptr_t)result == 0x1028000) {
        buddy_debug_print();
        TableEntry *d_tbe = ADDR_2_TBE(result); 
        printf("%d %d\n", d_tbe->size, d_tbe->allocated);
    }
    return result;
}

void buddy_free(void *addr) {
    TableEntry *tbe = ADDR_2_TBE(addr);
    TableEntry *parent_tbe = PARENT_TBE(tbe);
    TableEntry *right_son_tbe = RIGHT_SON_TBE(tbe);
    TableEntry *sibling_tbe = SIBLING_TBE(tbe);
    if (tbe->allocated == 0) {
        printf("SIZE: %p %d\n", addr, tbe->size);
    }
    assert(tbe->allocated == 1 || tbe->is_slab);
    int size_exp = tbe->size;
    LOG_INFO("freeing 2^(%d) memory from %p", size_exp, addr);

    TableList *list = &buddy[size_exp];
    LOG_LOCK("trying to fetch %d", list - buddy);
    spin_lock(&(list->lock));
    LOG_LOCK("fetched %d", list - buddy);
    spin_lock(&(parent_tbe->lock));
    spin_lock(&(right_son_tbe->lock));
    // can merge
    while (size_exp < MAX_ALLOC_SIZE_EXP) {
        assert(sibling_tbe == parent_tbe || sibling_tbe == right_son_tbe);
        if (sibling_tbe->allocated || sibling_tbe->size != size_exp || sibling_tbe->is_slab) {
            break;
        }
        sibling_tbe->allocated = 1;

        LOG_INFO("sibling info: size: %d allocated: %d is_slab: %d", sibling_tbe->size, sibling_tbe->allocated, sibling_tbe->is_slab);
        buddy_delete(sibling_tbe);
        spin_unlock(&(list->lock));
        LOG_LOCK("released %d", list - buddy);

        ++list;

        spin_unlock(&(parent_tbe->lock));
        spin_unlock(&(right_son_tbe->lock));

        LOG_LOCK("trying to fetch %d", list - buddy);
        spin_lock(&(list->lock));
        LOG_LOCK("fetched %d", list - buddy);

        tbe = PARENT_TBE(tbe);
        parent_tbe = PARENT_TBE(tbe);
        right_son_tbe = RIGHT_SON_TBE(tbe);
        sibling_tbe = SIBLING_TBE(tbe);

        spin_lock(&(parent_tbe->lock));
        spin_lock(&(right_son_tbe->lock));

        tbe->size = ++size_exp;

        assert(tbe->size >= PAGE_SIZE_EXP);
    }
    tbe->allocated = 0;
    spin_unlock(&(parent_tbe->lock));
    spin_unlock(&(right_son_tbe->lock));
    buddy_insert(tbe);
    spin_unlock(&(list->lock));
    LOG_LOCK("released %d", list - buddy);
}

void buddy_debug_print() {
#ifndef TEST
    static spinlock_t debug_lock = SPIN_INIT();
#else 
    static spinlock_t debug_lock = PTHREAD_MUTEX_INITIALIZER;
#endif
    spin_lock(&debug_lock);
    LOG_INFO("Printing Buddy System Lists from %d", cpu_current());
    for (int i = MAX_ALLOC_SIZE_EXP; i >= PAGE_SIZE_EXP; i--) {
        printf("List %d:\n", i);
        TableList *list = &buddy[i];
        spin_lock(&(list->lock));
        if (list->head == NULL) {
            printf("(empty)\n");
        }
        else {
            TableEntry *tbe = list->head;
            while (tbe) {
                printf("[%p, %p)", TBE_2_ADDR(tbe), TBE_2_ADDR(tbe) + (1 << tbe->size));
                if (tbe == list->tail) break;
                printf(" <-> ");
                tbe = tbe->next;
            }
            printf("\n");
        }
        spin_unlock(&(list->lock));
    }
    spin_unlock(&debug_lock);
}