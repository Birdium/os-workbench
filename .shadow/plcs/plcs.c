#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <time.h>
#include "thread.h"
#include "thread-sync.h"

#define MAXN 10000

#define MINN 0

int T, N, M;
char A[MAXN + 1], B[MAXN + 1];
int dp[MAXN * 2][MAXN];
int result;

mutex_t lk_id = MUTEX_INIT();
mutex_t lk = MUTEX_INIT();
cond_t cv = COND_INIT();

int cnt = 0, idx = 0, R = 0;

#define DP(x, y) (((x) >= 0 && (y) >= 0) ? dp[x][y] : 0)
#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))
#define MAX3(x, y, z) MAX(MAX(x, y), z)

inline void calc_t(int i, int j) {
  // printf("%d %d\n", i, j);
  int skip_a = DP(i - 1, j);
  int skip_b = DP(i - 1, j - 1);
  int take_both = DP(i - 2, j - 1) + (A[i - j] == B[j]);
  dp[i][j] = MAX3(skip_a, skip_b, take_both);
}

inline int get_index() {
  // mutex_lock(&lk_id);
  int ret = idx;
  if (idx <= R) idx++;
  // mutex_unlock(&lk_id);
  return ret;
}

void Tworker(int id) {
  for (int rd = MINN; rd < M + N - MINN - 1; ++rd) {
    while (1) {
      int j = get_index();
      if (j > R) break;
      calc_t(rd, j);
    }
    mutex_lock(&lk);
    cnt++;
    if (cnt == T) {
      // do sth
      cnt = 0;
      idx = MAX(0, rd - N + 2), R = MIN(rd + 2, M);
      cond_broadcast(&cv);
    }
    else {
      if (cnt > 0) 
        cond_wait(&cv, &lk);
    }
    mutex_unlock(&lk);
  }
}

int main(int argc, char *argv[]) {
  // No need to change
#ifndef DEBUG
  assert(scanf("%s%s", A, B) == 2);
  N = strlen(A);
  M = strlen(B);
  T = !argv[1] ? 1 : atoi(argv[1]);
  // Add preprocessing code here

#else
  for (int i = 0; i < MAXN; i++) {
    A[i] = 'A';
    B[i] = 'A';
  }
  A[MAXN] = '\0';
  B[MAXN] = '\0';
  N = strlen(A);
  M = strlen(B);
  T = !argv[1] ? 1 : atoi(argv[1]);
  clock_t start, end;
  start = clock();
#endif

  // for (int i = 0; i < T; i++) {
  //   create(Tworker);
  // }
  // join();  // Wait for all workers

  for (int i = 0; i < T; i++) {
    create(Tworker);
  }
  join();

#ifdef DEBUG
  end = clock();
  printf("time=%lf\n", (double)(end-start));
#endif

  printf("%d\n", dp[M + N - 2][M - 1]);
}
