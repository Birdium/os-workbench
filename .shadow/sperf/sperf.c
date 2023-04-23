#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>

void print_strings(char *strs[]) {
  for (int i = 0; ; i++) {
    if (strs[i] == NULL) break;
    printf("%s\n", strs[i]);
  }
}

int main(int argc, char *argv[], char *envp[]) {
  // char *exec_argv[] = { "strace", "ls", NULL, };
  // char *exec_envp[] = { "PATH=/bin", NULL, };
  // execve("strace",          exec_argv, exec_envp);
  // execve("/bin/strace",     exec_argv, exec_envp);
  // execve("/usr/bin/strace", exec_argv, exec_envp);
  char *exec_argv[] = malloc((argc + 2) * sizeof (char *));
  exec_argv[0] = "strace";
  exec_argv[1] = "-T";
  for (int i = 1; i <= argc; i++) {
    exec_argv[i + 1] = argv[i];
  }
  int fildes[2];
  if (pipe(fildes) != 0) {
    exit(-1);
  }
  int pid = fork();
  if (pid == 0) { // subproc
    // print_strings(argv + 1);
    // printf("\n");
    // print_strings(envp);
    // printf("\n%s\n", command);
    execve(exec_argv[0], exec_argv, envp);
    // assert(0);
  } 
  else {
    
  }
  perror(argv[0]);
  exit(EXIT_FAILURE);
}
