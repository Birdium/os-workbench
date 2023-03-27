#include <kernel.h>
#include <stdlib.h>
#include <stdio.h>
#include "../include/lock.h"
typedef struct {
    void *start, *end;
} Area;
static Area heap;