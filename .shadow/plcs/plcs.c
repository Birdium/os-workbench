#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "thread.h"
#include "thread-sync.h"

#define MAXN 10000
int T, N, M;
char A[MAXN + 1], B[MAXN + 1];
int dp[MAXN][MAXN];
int result;

int xchg(int volatile *ptr, int newval) {
  int result;
  asm volatile(
    "lock xchgl %0, %1"
    : "+m"(*ptr), "=a"(result)
    : "1"(newval)
    : "memory"
  );
  return result;
}

int locked = 0;

void lock() {
  while (xchg(&locked, 1)) ;
}

void unlock() {
  xchg(&locked, 0);
}

int commit_cnt = 0;
int flag[4] = {1, 1, 1, 1};

#define DP(x, y) (((x) >= 0 && (y) >= 0) ? dp[x][y] : 0)
#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))
#define MAX3(x, y, z) MAX(MAX(x, y), z)

// Always try to make DP code more readable
inline void calc(int i, int j) {
  int skip_a = DP(i - 1, j);
  int skip_b = DP(i, j - 1);
  int take_both = DP(i - 1, j - 1) + (A[i] == B[j]);
  dp[i][j] = MAX3(skip_a, skip_b, take_both);
}

void Tworker(int id) {
  if (id > T) {
    // This is a serial implementation
    // Only one worker needs to be activated
    return;
  }

#ifdef SINGLE
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < M; j++) {
       calc(i, j);
    }
  }
#else
  for (int k = 0; k < M + N - 1; k++) {
    lock();
    if (commit_cnt == T) {
      commit_cnt = 0;
      for (int i = 0; i < T; i++) {
        flag[i] = 1;
      }
    }
    unlock();
    while (1) {
      lock();
      if (flag[id - 1]) {
        flag[id - 1] = 0;
        break;
      }
      unlock();
    }
    unlock();
    for (int j = id - 1 + MAX(0, k - N + 1); j <= MIN(k, M - 1); j += T) { 
      calc(k - j, j);
    }
    lock();
    commit_cnt++;
    unlock();
  }
#endif

  result = dp[N - 1][M - 1];
}

int main(int argc, char *argv[]) {
  // No need to change
  assert(scanf("%s%s", A, B) == 2);
  N = strlen(A);
  M = strlen(B);
  T = !argv[1] ? 1 : atoi(argv[1]);

  // Add preprocessing code here

  for (int i = 0; i < T; i++) {
    create(Tworker);
  }
  join();  // Wait for all workers

  printf("%d\n", result);
}
