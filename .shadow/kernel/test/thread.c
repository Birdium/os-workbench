#include "thread.h"

struct thread tpool[NTHREAD], *tptr = tpool;

tptr = tpool;

int cpu_tid[NTHREAD];