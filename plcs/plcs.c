#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <time.h>
#include "thread.h"
#include "thread-sync.h"

#define MAXN 10000
int T, N, M;
char A[MAXN + 1], B[MAXN + 1];
int dp[MAXN][MAXN];
int result;

mutex_t lock = MUTEX_INIT();
cond_t cv = COND_INIT();

int commit_cnt = 0;

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

// inline void calc_t(int i, int j) {
//   int skip_a = DP(i - 1, j);
//   int skip_b = DP(i - 1, j - 1);
//   int take_both = DP(i - 2, j - 1) + (A[i - j] == B[j]);
//   dp[i][j] = MAX3(skip_a, skip_b, take_both);
// }

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
  result = dp[N - 1][M - 1];
#else
  for (int k = 0; k < M + N - 1; k++) {
    int L = MAX(0, k - N + 1), R = MIN(k + 1, M);
    int l = L + (R - L) / T * (id - 1), r = (id != T) ? (L + (R - L) / T * id) : R;
    for (int j = l; j < r; j++) { 
      calc(k - j, j);
    }
    // for (int j = L + id - 1; j < R; j += T) {
    //   calc(k - j, j);
    // }
    mutex_lock(&lock);
    ++commit_cnt;
    if (commit_cnt == T) {
      commit_cnt = 0;
      cond_broadcast(&cv);
    }
    else {
      if (commit_cnt > 0)
        cond_wait(&cv, &lock);
    }
    mutex_unlock(&lock);
  }
  // }
  result = dp[N - 1][M - 1];
#endif

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
  // clock_t start, end;
  // start = clock();
#endif

  for (int i = 0; i < T; i++) {
    create(Tworker);
  }
  join();  // Wait for all workers

#ifdef DEBUG
  // end = clock();
  // printf("time=%lf\n", (double)(end-start));
#endif

  printf("%d\n", result);
}
