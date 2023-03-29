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

spinlock_t lock = SPIN_INIT();

atomic_int cnt = 0;
atomic_int sig[17];

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
    atomic_fetch_add(&cnt, 1);
    // printf("thread %d: %d %d\n", id, k, cnt);
    while (atomic_load(&sig[id]) == 0);
    atomic_store(&sig[id], 0);
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

  T--;

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
    // printf("main: %d %d\n", k, cnt);
    while (atomic_load(&cnt) < T);
    atomic_store(&cnt, 0);
    for (int i = 1; i <= T; i++) {
      atomic_store(&sig[i], 1);
    }
  }

  join();  // Wait for all workers
  
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
