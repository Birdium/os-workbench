#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <stddef.h>

#define MAXLEN 1024

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
  char **exec_argv = malloc((argc + 2) * sizeof (char *));
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
    close(fildes[0]);
    if (dup2(fildes[1], STDERR_FILENO) == -1) {
      perror("dup2");
      exit(EXIT_FAILURE);
    }
    close(fildes[0]);
    char *path = getenv("PATH");
    char *new_path = malloc(sizeof(char) * strlen(path) + 1);
    strcpy(new_path, path);
    char buf[MAXLEN];
    const char delim[] = ":";
    char *token = strtok(new_path, delim);
    while (token != NULL) {
      int path_length = strlen(token);
      if (path_length + strlen("/strace") >= MAXLEN) {
        fprintf(stderr, "Error: strace path too long.\n");
        exit(-1);
      }
      strcpy(buf, token);
      strcat(buf, "/strace");
      exec_argv[0] = buf;
      execve(exec_argv[0], exec_argv, envp);
      token = strtok(NULL, delim);
    }
    assert(0);
  } 
  else {
    close(fildes[1]);
    char buf[MAXLEN];
    while (fgets(buf, MAXLEN, fdopen(fildes[0], "r")) != NULL) {
      puts(buf);
    }
  }
  perror(argv[0]);
  exit(EXIT_FAILURE);
}
