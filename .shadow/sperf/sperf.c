#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <stddef.h>
#include <fcntl.h>
#include <time.h>
#include <regex.h>
#include <errno.h>

#define MAXLEN 4096

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

void list_bubble(Node *p) {
  assert(p);
  while (p->prev && p->time > p->prev->time) {
    Node *q = p->prev;
    if (q->prev) q->prev->next = p;
    if (p->next) p->next->prev = q;
    q->next = p->next;
    p->prev = q->prev; 
    q->prev = p;
    p->next = q;
    if (head == q) head = p;
    if (tail == p) tail = q;
  }
}

void list_sort() {
  Node *p = head;
  while (p) {
    Node *q = p->next;
    list_bubble(p);
    p = q;
  }
}

void list_update(char *name, double time) {
  tot_time += time;
  Node *p = head;
  if (p == NULL) {
    head = tail = newNode(name, time);
    return;
  }
  while (p) {
    if (strcmp(p->name, name) == 0) {
      p->time += time;
      list_bubble(p);
      return;
    }
    p = p->next;
  }
  Node *n = newNode(name, time);
  tail->next = n;
  n->prev = tail;
  tail = n;
  // list_bubble(n);
}

void list_print(){
  list_sort();
  Node *p = head;
  int cnt = 0;
  while (p && cnt < 5) {
    // printf("%s (%d%%) %lf\n", p->name, (int)(p->time / tot_time * 100), p->time);
    printf("%s (%d%%)\n", p->name, (int)(p->time / tot_time * 100));
    p = p->next;
    cnt++;
  }
  for(int i = 0; i < 80; i++) 
    putchar('\0');
  fflush(stdout);
}

static char *strccpy(char *s1, char *s2, char c) {
  char *d = s1; 
  while (*s2 && *s2 != c) {
    *s1++ = *s2++;
  }
  *s1 = 0;
  return d;
}

int main(int argc, char *argv[], char *envp[]) {
  char **exec_argv = malloc((argc + 2) * sizeof (char *));
  exec_argv[0] = "strace";
  exec_argv[1] = "-T";
  for (int i = 1; i <= argc; i++) {
    exec_argv[i + 1] = argv[i];
  }
  int fildes[2];
  if (pipe(fildes) != 0) {
    exit(2);
  }
  // int pid = fork();
  // if (pid == 0) { // subproc 
    close(fildes[0]);
    if (dup2(fildes[1], STDERR_FILENO) == -1) {
      perror("dup2");
      exit(3);
    }
    int nullfd = open("/dev/null", O_WRONLY);
    if (nullfd == -1) {
      perror("open");
      exit(4);
    }
    if (dup2(nullfd, STDOUT_FILENO) == -1) {
      perror("dup2");
      exit(5);
    }
    char *path = getenv("PATH");
    // int ret = path[5];
    char buf[MAXLEN];
    const char delim = ':';
    while (*path) {
      strccpy(buf, path, delim);
      if (*buf != 0 && buf[strlen(buf) - 1] != '/') {
        strcat(buf, "/");
      }
      strcat(buf, "strace");
      execve(buf, exec_argv, envp);
      while (*path && *path != delim) path++;
      if (*path == delim) path++;
    }
    exit(errno);
  // } 
  // else {
  //   close(fildes[1]);
  //   if (dup2(fildes[0], STDIN_FILENO) == -1) {
  //     perror("dup2");
  //     exit(7);
  //   }
  //   char buf[MAXLEN];
  //   time_t new_time, old_time;

  //   regmatch_t pmatch[3];
  //   const size_t nmatch = 3;
  //   regex_t reg;
  //   // const char *pattern = "(\\w+)\\(.+\\).+<(\\d+\\.\\d+)>\\s*";
  //   const char *pattern = "(\\w+)\\(.+\\).+<(.+)>\\s*";
  //   if (regcomp(&reg, pattern, REG_EXTENDED)) {
  //     perror("regcomp");
  //     exit(8);
  //   }

  //   old_time = time(NULL);
  //   while (fgets(buf, MAXLEN, stdin) != NULL) { 
  //     if (regexec(&reg, buf, nmatch, pmatch, 0) != REG_NOMATCH) {
  //       char name_s[MAXLEN], time_s[MAXLEN];
  //       strncpy(name_s, buf + pmatch[1].rm_so, pmatch[1].rm_eo - pmatch[1].rm_so);
  //       strncpy(time_s, buf + pmatch[2].rm_so, pmatch[2].rm_eo - pmatch[2].rm_so);
  //       name_s[pmatch[1].rm_eo - pmatch[1].rm_so] = time_s[pmatch[2].rm_eo - pmatch[2].rm_so] = 0;
  //       double time_d = atof(time_s);
  //       // printf("%s %s %lf\n", name_s, time_s, time_d);
  //       list_update(name_s, time_d);
  //     }
  //     else {
  //       if (buf[0] == '+' && buf[1] == '+') {
  //         list_print();
  //         regfree(&reg);
  //         exit(EXIT_SUCCESS);
  //       }
  //     }
  //     new_time = time(NULL);
  //     if ((new_time - old_time) > .1f) {
  //       list_print();
  //       old_time = time(NULL);
  //     }
  //   }
  // }
  // perror(argv[0]);
  // exit(9);
}
