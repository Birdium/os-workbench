#ifndef UPROC_H
#define UPROC_H

#include "os.h"

#define UPROC_PID_NUM 32768

typedef struct pid_entry {
	int valid;
	task_t task;
} pid_entry_t;

#endif