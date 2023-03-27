#include <stdlib.h>
#include <kernel.h>

typedef struct {
    void *start, *end;
} Area;
static Area heap;