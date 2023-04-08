#include <kernel.h>
#include <stdlib.h>
#include <stdio.h>
#include <thread.h>
#include <thread-sync.h>
#include "buddy.h"

#define PAGE_SIZE 4096

typedef struct {
    void *start, *end;
} Area;
static Area heap;