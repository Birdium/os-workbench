#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <stddef.h>
#include <fcntl.h>
#include <time.h>
#include <regex.h>

#define MAXLEN 1024

void print_strings(char *strs[]) {
  for (int i = 0; ; i++) {
    if (strs[i] == NULL) break;
    printf("%s\n", strs[i]);
  }
}

typedef struct Node {
  char name[MAXLEN];
  double time;
  struct Node *prev, *next;
} Node;

Node *head = NULL, *tail = NULL;
int list_size = 0;
double tot_time = .0f;

Node *newNode(char *name, double time) {
  Node *result = malloc(sizeof(Node));
  strcpy(result->name, name);
  result->time = time;
  result->prev = result->next = NULL;
  return result;
}

void list_update(char *name, double time) {
  tot_time += time;
  printf("%s %lf\n", name, time);
  Node *p = head;
  if (p == NULL) {
    head = tail = newNode(name, time);
    return;
  }
  while (p) {
    if (strcmp(p->name, name) == 0) {
      p->time += time;
      return;
    }
    p = p->next;
  }
  p = head;
  Node *n = newNode(name, time);
  while (p) {
    if (time > p->time) {
      if (p->prev) {
        p->prev->next = n;
        n->prev = p->prev;
        p->prev = n;
        n->next = p;
      }
      else {
        head->prev = n;
        n->next = head;
        head = n;
      }
      return;
    }
    p = p->next;
  }
  tail->next = n;
  n->prev = tail;
  tail = n;
}

void list_print(){
  Node *p = head;
  int cnt = 0;
  while (p && cnt < 5) {
    printf("%s (%d%%)\n", p->name, (int)(p->time / tot_time * 100));
    p = p->next;
    cnt++;
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
    int nullfd = open("/dev/null", O_WRONLY);
    if (nullfd == -1) {
      perror("open");
      exit(EXIT_FAILURE);
    }
    if (dup2(nullfd, STDOUT_FILENO) == -1) {
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
    if (dup2(fildes[0], STDIN_FILENO) == -1) {
      perror("dup2");
      exit(EXIT_FAILURE);
    }
    char buf[MAXLEN];
    time_t new_time, old_time;

    regmatch_t pmatch[3];
    const size_t nmatch = 3;
    regex_t reg;
    // const char *pattern = "(\\w+)\\(.+\\).+<(\\d+\\.\\d+)>\\s*";
    const char *pattern = "(\\w+)\\(.+\\).+<(.+)>\\s*";
    if (regcomp(&reg, pattern, REG_EXTENDED)) {
      perror("regcomp");
      exit(EXIT_FAILURE);
    }

    while (fgets(buf, MAXLEN, stdin) != NULL) { 
      if (regexec(&reg, buf, nmatch, pmatch, 0) != REG_NOMATCH) {
        char name_s[MAXLEN], time_s[MAXLEN];
        strncpy(name_s, buf + pmatch[1].rm_so, pmatch[1].rm_eo - pmatch[1].rm_so);
        strncpy(time_s, buf + pmatch[2].rm_so, pmatch[2].rm_eo - pmatch[2].rm_so);
        name_s[pmatch[1].rm_eo - pmatch[1].rm_so] = time_s[pmatch[1].rm_eo - pmatch[1].rm_so] = 0;
        double time_d = atof(time_s);
        list_update(name_s, time_d);
        list_print();
      }
    }
  }
  perror(argv[0]);
  exit(EXIT_FAILURE);
}
