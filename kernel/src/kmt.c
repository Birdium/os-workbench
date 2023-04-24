#include <os.h>

static void kmt_init() {
    //TODO: kmt init
}

static void kmt_create() {
    //TODO: kmt create
}

static void kmt_teardown() {
    //TODO: kmt teardown
}

static void kmt_sem_init() {
    //TODO: sem init
}

static void kmt_sem_signal() {
    //TODO: sem signal
}

static void kmt_sem_wait() {
    //TODO: sem wait
}

static void kmt_spin_init() {
    //TODO: spin init
}
static void kmt_spin_lock() {
    //TODO: spin lock
}
static void kmt_spin_unlock() {
    //TODO: spin unlock
}

MODULE_DEF(kmt) = {
    .init = kmt_init,
    .create = kmt_create,
    .teardown = kmt_teardown,
    .sem_init = kmt_sem_init,
    .sem_signal = kmt_sem_signal,
    .sem_wait = kmt_sem_wait,
    .spin_init = kmt_spin_init,
    .spin_lock = kmt_spin_lock,
    .spin_unlock = kmt_spin_unlock,
};
