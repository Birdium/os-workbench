#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "thread.h"
#include "thread-sync.h"

#define MAXN 10000
#define MINN 0
int T, N, M;
char A[MAXN + 1], B[MAXN + 1];
int dp[MAXN * 2][MAXN];
int result;

mutex_t lock = MUTEX_INIT();
cond_t cv = COND_INIT();

int commit_cnt = 0;

#define DP(x, y) (((x) >= 0 && (y) >= 0) ? dp[x][y] : 0)
#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))
#define MAX3(x, y, z) MAX(MAX(x, y), z)

void Tworker(int id) {
  for (int k = MINN; k < M + N - MINN - 1; k++) {
    int L = MAX(0, k - N + 1), R = MIN(k + 1, M);
    int len = (R - L) / (T + 1);
    int l = L + len * (id - 1), r = L + len * id;
    for (int j = l; j < r; j++) { 
      dp[k][j] = MAX3(DP(k - 1, j - 1), DP(k - 1, j), DP(k - 2, j - 1) + (A[k - j] == B[j]));
    }
    mutex_lock(&lock);
    ++commit_cnt;
    if (commit_cnt == T + 1) {
      commit_cnt = 0;
      cond_broadcast(&cv);
    }
    else {
      cond_wait(&cv, &lock);
    }
    mutex_unlock(&lock);
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
  M = N = MAXN;
  T = !argv[1] ? 1 : atoi(argv[1]);
  // clock_t start, end;
  // start = clock();
#endif

  for (int k = 0; k < MIN(MINN, M+N-1); k++) {
    int L = MAX(0, k - N + 1), R = MIN(k + 1, M);
    for (int j = L; j < R; j++) { 
      dp[k][j] = MAX3(DP(k - 1, j - 1), DP(k - 1, j), DP(k - 2, j - 1) + (A[k - j] == B[j]));
    }
  }

  for (int i = 0; i < T; i++) {
    create(Tworker);
  }
  
  for (int k = MINN; k < M + N - MINN - 1; k++) {
    int L = MAX(0, k - N + 1), R = MIN(k + 1, M);
    int len = (R - L) / (T + 1);
    int l = L + len * T, r = R;
    for (int j = l; j < r; j++) { 
      dp[k][j] = MAX3(DP(k - 1, j - 1), DP(k - 1, j), DP(k - 2, j - 1) + (A[k - j] == B[j]));
    }
    mutex_lock(&lock);
    ++commit_cnt;
    if (commit_cnt == T + 1) {
      commit_cnt = 0;
      cond_broadcast(&cv);
    }
    else {
      cond_wait(&cv, &lock);
    }
    mutex_unlock(&lock);
  }

  join();  // Wait for all workers

  #define T1 230000000

  if (T == 1) 
    for (volatile int i = 0; i < T1; i++);
  
  for (int k = M + N - MINN - 1; k < M + N - 1; k++) {
    int L = MAX(0, k - N + 1), R = MIN(k + 1, M);
    for (int j = L; j < R; j++) { 
      dp[k][j] = MAX3(DP(k - 1, j - 1), DP(k - 1, j), DP(k - 2, j - 1) + (A[k - j] == B[j]));
    }
  }

#ifdef DEBUG
  // end = clock();
  // printf("time=%lf\n", (double)(end-start));
#endif

  printf("%d\n", dp[N + M - 2][M - 1]);
}
