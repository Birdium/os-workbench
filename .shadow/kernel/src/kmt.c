#include <os.h>

static void kmt_init() {
    //TODO: kmt init
}

static int kmt_create(task_t *task, const char *name, void (*entry)(void *arg), void *arg) {
    //TODO: kmt create
    return 0;
}

static void kmt_teardown(task_t *task) {
    //TODO: kmt teardown
}

static void kmt_sem_init(sem_t *sem, const char *name, int value) {
    //TODO: sem init
}

static void kmt_sem_signal(sem_t *sem) {
    //TODO: sem signal
}

static void kmt_sem_wait(sem_t *sem) {
    //TODO: sem wait
}

// static kmt_spin_cpu_cnt[MAX_CPU];

static void kmt_spin_init(spinlock_t *lk, const char *name) {
    lk->locked = 0;
    lk->name = name;
}

static void kmt_spin_lock(spinlock_t *lk) {
    // TODO:
    bool i = ienabled();
    iset(false);
    while(atomic_xchg(&lk->locked, 1) != 0);
    if (i) iset(true);
}
static void kmt_spin_unlock(spinlock_t *lk) {
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
