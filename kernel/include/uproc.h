#ifndef UPROC_H
#define UPROC_H

#include "os.h"
#include "list.h"

#define MMAP_NONE  0x00000000 // no access
#define MMAP_READ  0x00000001 // can read
#define MMAP_WRITE 0x00000002 // can write

#define UPROC_PID_NUM 32768


typedef struct mapping {
	void *va, *pa;
} mapping_t;

DEF_LIST(mapping_t);

typedef struct pid_entry {
	int valid;
	task_t task;
	mapping_t_list *mappings;
} pid_entry_t;

#endif