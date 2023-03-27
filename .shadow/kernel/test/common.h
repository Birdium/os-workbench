#include <kernel.h>
#include <stdlib.h>
#include <stdio.h>
#include <thread.h>

typedef struct {
    void *start, *end;
} Area;
static Area heap;