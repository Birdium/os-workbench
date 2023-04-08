#include "buddy.h"

// table is a bitmap maintains the mapping to buddy system's addrspace 
// mem layout now:
// [heap] = [table, buddy]
// TODO: implement slab
static TableEntry *table, *buddy_start;

// buddy is a static array with buddy[i] indicating to size (2^i)'s 
// page's array

static TableEntry *buddy[32];


void init_buddy() {
    table = heap.start;
    buddy_start = (TableEntry *)ROUNDUP(table + PAGE_NUM, MAX_ALLOC_SIZE);
    int buddy_page = ADDR_2_TBN(buddy_start);
    // init all buddy
    for (int i = buddy_page; i < PAGE_NUM; i += MAX_ALLOC_PAGE_NUM) {
        table[i].size = MAX_ALLOC_SIZE_EXP;
        table[i].allocated = 0;
        table[i].prev = (i != buddy_page) ? NULL : &table[i - MAX_ALLOC_PAGE_NUM];
        table[i].next = (i != PAGE_NUM) ? NULL : &table[i + MAX_ALLOC_PAGE_NUM];
    }
    memset(buddy, 0, sizeof(buddy));
    buddy[MAX_ALLOC_SIZE_EXP] = buddy_start;
    LOG_INFO("buddy system allocated from %p to %p", buddy_start, heap.end);
}