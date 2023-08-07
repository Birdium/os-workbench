#ifndef UPROC_H
#define UPROC_H

#include "os.h"
#include "list.h"

#define MAP_SHARED    1
#define MAP_PRIVATE   2
#define MAP_UNMAP     3

#define MMAP_NONE  0x00000000 // no access
#define MMAP_READ  0x00000001 // can read
#define MMAP_WRITE 0x00000002 // can write

#define UPROC_PID_NUM 32768


typedef struct mapping {
	void *va, *pa;
	int prot, flags;
} mapping_t;

DEF_LIST(mapping_t);

typedef struct pid_entry {
	int valid;
	task_t *task;
	mapping_t_list *mappings;
} pid_entry_t;

#endif