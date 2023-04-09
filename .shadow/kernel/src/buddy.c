#include "buddy.h"

// table is a bitmap maintains the mapping to buddy system's addrspace 
// mem layout now:
// [heap] = [table, buddy]
// TODO: implement slab
static TableEntry *table, *buddy_start;

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
        table[i].size = MAX_ALLOC_SIZE_EXP;
        table[i].allocated = 0;
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
    TableList *list = &buddy[sz];
    // LOG_INFO("%p", list);
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
}

// should require lock outside this func
void buddy_delete(TableEntry *tbe) {
    int sz = tbe->size;
    TableList *list = &buddy[sz];
    assert(list->head && list->tail);
    if (list->head == list->tail) {
        assert(list->head == tbe);
        list->head = list->tail = NULL;
    }
    else if (list->head == tbe) {
        list->head = tbe->next;
        list->head->prev = NULL;
        
    }
    else if (list->tail == tbe) {
        list->tail = tbe->prev;
        list->tail->next = NULL;
    }
    tbe->prev = tbe->next = NULL;
}

// get a smallest chunk whose size >= 2^(exp)
// remove it's tbe from buddy system and return the physical addr  
void *buddy_fetch_best_chunk(int exp) {
    void *chunk = NULL;
    while (exp < MAX_ALLOC_SIZE_EXP) {
        TableList *list = &buddy[exp];
        spin_lock(&(list->lock));
        if (list->head != NULL) {
            chunk = TBE_2_ADDR(list->head);
            assert(0);
            assert(list->head->allocated == 0);
            list->head->allocated = 1;
            buddy_delete(list->head);
        }
        spin_unlock(&(list->lock));
        ++exp;
    } 
    return chunk;
}

// just an allocator
void *buddy_alloc(size_t size) {
    // assume alloc is aligned
    LOG_INFO("allocating %d memory", size);
    int size_exp = PAGE_SIZE_EXP;
    while (size_exp < MAX_ALLOC_SIZE_EXP && (1 << size_exp) != size) 
        ++size_exp;
    LOG_INFO("allocating 2^(%d) memory", size_exp);
    void *result = buddy_fetch_best_chunk(size_exp);
    TableEntry *tbe = ADDR_2_TBE(result);
    LOG_INFO("fetched page start from %p with size %d", result, (1<<tbe->size));
    // split tbe into 2
    while (tbe->size > size_exp) {
        tbe->size--;
        TableEntry *split_tbe = tbe + (1 << (tbe->size));
        split_tbe->size = tbe->size;
        spin_lock(&(buddy[tbe->size].lock));
        buddy_insert(split_tbe);
        spin_unlock(&(buddy[tbe->size].lock));
    }
    return result;
}
