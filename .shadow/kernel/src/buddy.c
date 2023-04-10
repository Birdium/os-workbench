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
    TableList *list = &buddy[sz];
    LOG_INFO("Deleting %p, size %d", TBE_2_ADDR(tbe), (1 << tbe->size));
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
    if (tbe->prev) tbe->prev->next = tbe->next;
    if (tbe->next) tbe->next->prev = tbe->prev;
    tbe->prev = tbe->next = NULL;
}

// get a smallest chunk whose size >= 2^(exp)
// remove it's tbe from buddy system and return the physical addr  
void *buddy_fetch_best_chunk(int exp) {
    void *chunk = NULL;
    while (exp <= MAX_ALLOC_SIZE_EXP) {
        TableList *list = &buddy[exp];
        LOG_LOCK("trying to fetch %p", &(list->lock));
        spin_lock(&(list->lock));
        LOG_LOCK("fetched %p", &(list->lock));
        if (list->head != NULL) {
            chunk = TBE_2_ADDR(list->head);
            LOG_INFO("%p", chunk);
            assert(list->head->allocated == 0);
            list->head->allocated = 1;
            buddy_delete(list->head);
        }
        spin_unlock(&(list->lock));
        LOG_LOCK("released %p", &(list->lock));
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
    TableEntry *tbe = ADDR_2_TBE(result);
    LOG_INFO("fetched page start from %p with size %d", result, (1<<tbe->size));
    // split tbe into 2
    while (tbe->size > size_exp) {
        tbe->size--;
        TableEntry *split_tbe = tbe + (1 << (tbe->size - PAGE_SIZE_EXP));
        split_tbe->size = tbe->size;
        split_tbe->allocated = 0;
        LOG_INFO("splitting %p with size %d", TBE_2_ADDR(split_tbe), (1<<tbe->size));
        TableList *list = &buddy[tbe->size];
        LOG_LOCK("trying to fetch %p", &(list->lock));
        spin_lock(&(list->lock));
        LOG_LOCK("fetched %p", &(list->lock));
        buddy_insert(split_tbe);
        spin_unlock(&(list->lock));
        LOG_LOCK("released %p", &(list->lock));
    }
    return result;
}

void buddy_free(void *addr) {
    TableEntry *tbe = ADDR_2_TBE(addr);
    assert(tbe->allocated == 1);
    int size_exp = tbe->size;
    LOG_INFO("freeing 2^(%d) memory from %p", size_exp, addr);
    TableList *list = &buddy[size_exp];
    spin_lock(&(list->lock));
    // can merge
    while (size_exp < MAX_ALLOC_SIZE_EXP) {
        TableEntry *sibling_tbe = SIBLING_TBE(tbe);
        if (sibling_tbe->allocated || sibling_tbe->size != size_exp) 
            break;
        sibling_tbe->allocated = 1;
        buddy_delete(sibling_tbe);
        spin_unlock(&(list->lock));
        ++list;
        spin_lock(&(list->lock));
        tbe = PARENT_TBE(tbe);
        tbe->size = ++size_exp;
    }
    tbe->allocated = 0;
    buddy_insert(tbe);
    spin_unlock(&(list->lock));
}

static spinlock_t debug_lock = SPIN_INIT();
void buddy_debug_print() {
#ifdef DEBUG
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
#endif
}