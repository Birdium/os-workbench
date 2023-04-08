#include <kernel.h>
#include <stdlib.h>
#include <stdio.h>
#include <thread.h>
#include <thread-sync.h>
#include "buddy.h"

typedef struct {
    void *start, *end;
} Area;
static Area heap;