#ifndef COMMON_H
#define COMMON_H

#include <kernel.h>
#include <klib.h>
#include <klib-macros.h>

#define ROUNDUP(a, sz)      ((((uintptr_t)a) + (sz) - 1) & ~((sz) - 1))
#define ROUNDDOWN(a, sz)    ((((uintptr_t)a)) & ~((sz) - 1))

static inline void log_info(const char *fmt, ...) {
#ifdef DEBUG
    printf(fmt, ...);
#endif
}

#endif