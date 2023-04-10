#ifndef SLAB_H
#define SLAB_H
#include <common.h>

// typedef struct SlabEntry {
// 	int 
// }

void slab_init();
void *slab_alloc(size_t size);
void slab_free(void *addr);

#endif