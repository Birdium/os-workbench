#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[], char *envp[]) {
  // char *exec_argv[] = { "strace", "ls", NULL, };
  // char *exec_envp[] = { "PATH=/bin", NULL, };
  // execve("strace",          exec_argv, exec_envp);
  // execve("/bin/strace",     exec_argv, exec_envp);
  // execve("/usr/bin/strace", exec_argv, exec_envp);
  char *command = argv[1];
  // printf("%s\n", command);
  int fildes[2];
  if (pipe(fildes) != 0) {
    exit(-1);
  }
  int pid = fork();
  if (pid == 0) { // subproc
    execve(command, argv + 1, envp);
    assert(0);
  } 
  else {
    
  }
  perror(argv[0]);
  exit(EXIT_FAILURE);
}
