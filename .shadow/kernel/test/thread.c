#include "thread.h"

struct thread tpool[NTHREAD], *tptr = tpool;

int cpu_tid[NTHREAD];