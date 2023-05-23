#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>
#include <dlfcn.h>
#include <assert.h>
#include <sys/wait.h>

bool is_Func(char *str) {
  if (strlen(str) <= 2) return false;
  return str[0] == 'i' && str[1] == 'n' && str[2] == 't';
}

char src_filename[128], dst_filename[128], func_name[32];

void extract_func_name(char *line) {
  char *p = line + 3, *q = func_name;
  while (*p && !isspace(*p)) {
    p++;
  }
  while (*p && isspace(*p)) {
    *q = *p; 
    p++; q++;
  }
  *q = '\0';
}

static int expr_cnt = 0;

int comp_func(char *line) {
  bool is_func = is_Func(line);
  if (is_func) {
    extract_func_name(line);
  }
  else {
    sprintf(func_name, "__expr_wrapper_%d", expr_cnt);
    expr_cnt++;
  }
  sprintf(src_filename, "/tmp/crepl_%s.c-XXXXXX", func_name);
  sprintf(dst_filename, "/tmp/crepl_%s.so-XXXXXX", func_name);
  if (mkstemp(src_filename) < 0 || mkstemp(dst_filename) < 0) {
    perror("mkstemp failed!");
    return -1;
  }
  FILE *src = fopen(src_filename, "w");
  if (src == NULL) {
    perror("failed to create src file");
  }
  if (is_func) {
    fprintf(src, "%s\n", line);
  }
  else {
    fprintf(src, "int %s() { return %s; } \n", func_name, line);
  }
  fclose(src);
  char *new_argv[] = {
    "gcc", 
    "-xc",
    "-shared",
    "-fPIC", 
    "-o",
    dst_filename,
    src_filename,
    "-ldl",
    NULL
  };
  int pid = fork();
  if (pid == 0) { // son
    execvp("gcc", new_argv);
    assert(0); // should not reach here
  }
  else {
    wait(NULL);
    void *dl = dlopen(dst_filename, RTLD_NOW);
    if (dl == NULL) {
      printf("dlopen failed.\n");
      return -1;
    }
    if (is_func) {
      printf("OK.\n");
    }
    else {
      int (*expr)() = dlsym(dl, func_name);
      printf("= %d.\n", expr());
    }
  }
  return 0;
}

int main(int argc, char *argv[]) {
  static char line[4096];
  while (1) {
    printf("crepl> ");
    fflush(stdout);
    if (!fgets(line, sizeof(line), stdin)) {
      break;
    }
    // printf("Got %zu chars.\n", strlen(line)); // ??
    comp_func(line);
  }
}
