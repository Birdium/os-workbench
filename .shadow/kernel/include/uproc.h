#ifndef UPROC_H
#define UPROC_H

#include "os.h"
#include "list.h"

#define UPROC_PID_NUM 32768

typedef struct mapping {
	void *va, *pa;
	int prot, flags;
} mapping_t;

DEF_LIST(mapping_t);
DEF_LIST(Area);

typedef struct pid_entry {
	int valid;
	task_t *task;
	mapping_t_list *mappings;
	Area_list *mareas;
} pid_entry_t;

#endif