#ifndef THREAD_H
#define THREAD_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdatomic.h>
#include <assert.h>
#include <unistd.h>
#include <pthread.h>

#define NTHREAD 64
enum { T_FREE = 0, T_LIVE, T_DEAD, };
struct thread {
  int id, status;
  pthread_t thread;
  void (*entry)(int);
};

// int cpu_current() {
extern int cpu_tid[NTHREAD];

static struct thread tpool[NTHREAD], *tptr = tpool;

static inline int cpu_count() {
  return tptr - tpool + 1;
}

static inline int cpu_current() {
  int retval = -1;
  int self = pthread_self();
  for (int i = 1; i <= cpu_count(); i++) {
    printf("%d cpu_tid %d %d\n", i, cpu_tid[i], self);
    if (cpu_tid[i] == self) {
      retval = i;
    }
  }
  printf("%d\n", retval);
  return retval;
}

static inline void set_tid(int cpu_id) {
  cpu_tid[cpu_id] = pthread_self();
  printf("%d %d %d\n", cpu_id, pthread_self(), cpu_tid[cpu_id] );
}


static void *wrapper(void *arg) {
  struct thread *thread = (struct thread *)arg;
  thread->entry(thread->id);
  return NULL;
}

static void create(void *fn) {
  assert(tptr - tpool < NTHREAD);
  *tptr = (struct thread) {
    .id = tptr - tpool + 1,
    .status = T_LIVE,
    .entry = fn,
  };
  pthread_create(&(tptr->thread), NULL, wrapper, tptr);
  ++tptr;
}

static void join() {
  for (int i = 0; i < NTHREAD; i++) {
    struct thread *t = &tpool[i];
    if (t->status == T_LIVE) {
      pthread_join(t->thread, NULL);
      t->status = T_DEAD;
    }
  }
}

static __attribute__((destructor)) void cleanup() {
  join();
}

#endif