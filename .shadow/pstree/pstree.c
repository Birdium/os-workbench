#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <dirent.h>
#include <getopt.h>
#include <string.h>

#define MAX_PROCS   114514
#define NAME_LEN    256
#define PATH_LEN    320

struct Proc{
  int pid, ppid;
  char name[NAME_LEN];
} procs[MAX_PROCS];


int cnt;
int show_pids = 0, numeric_sort = 0;

void print_version() {
  fprintf(stderr, "pstree lite 114.514\n");
  fprintf(stderr, "Copyright (C) 1919-810 Birdium\n\n");
  fprintf(stderr, "PSmisc comes with ABSOLUTELY NO WARRANTY.\nThis is free software, and you are welcome to redistribute it under\nthe terms of the GNU General Public License.\nFor more information about these matters, see the files named COPYING.\n");
}

void get_procs(){
  DIR *dp;
  struct dirent *entry;
  dp = opendir("/proc");
  if (dp){
    while((entry = readdir(dp)) != NULL) {
      if (atoll(entry->d_name) > 0) {
        // printf("PID:%s\t", entry->d_name);
        char path[PATH_LEN];
        pid_t pid = 0, ppid; char proc_name[NAME_LEN];
        sprintf(path, "/proc/%s/status", entry->d_name);
        FILE *fp = fopen(path, "r");
        if (fp == NULL) {
          assert(0);
        }
        fscanf(fp, "Name:\t%s", proc_name);
        while (fscanf(fp, "Pid:\t%d", &pid) != 1){
          fgets(path, PATH_LEN, fp);
        }
        while (fscanf(fp, "PPid:\t%d", &ppid) != 1){
          fgets(path, PATH_LEN, fp);
        }
        strcpy(procs[cnt].name, proc_name);
        procs[cnt].pid = pid;
        procs[cnt].ppid = ppid;
        cnt++;
        // printf("%s\n", proc_name);
        fclose(fp);
      }
    }

    closedir(dp);
    return;
  }
  assert(0);
}

void dfs(int x, int dep){
  for(int i = 0; i < dep; i++) {
    printf("\t");
  }
  printf("%s", procs[x].name);
  if (show_pids) printf("(%d)", procs[x].pid);
  printf("\n");
  for(int i = 0; i < cnt; i++) {
    if (procs[i].ppid == procs[x].pid) {
      dfs(i, dep + 1);
    }
  }
}

void print_tree(){
  int st = 0;
  for (int i = 0; i < cnt; i++){
    if (procs[i].ppid == 0){
      st = i; break;
    } 
  }
  dfs(st, 0);
}

void parse_args(int argc, char *argv[]) {
  int o;
  static struct option table[] = {
    {"show-pids",     no_argument, 0, 'p'},
    {"numeric-sort",  no_argument, 0, 'n'},
    {"version",       no_argument, 0, 'V'}
  };
  while ( (o = getopt_long(argc, argv, "pnV", table, NULL)) != -1 ) {
    switch (o) {
      case 'p': show_pids = 1; break;
      case 'n': numeric_sort = 1; break;
      case 'V': print_version(); exit(0);
      default: break;
    }
  }
}

int main(int argc, char *argv[]) {
  for (int i = 0; i < argc; i++) {
    assert(argv[i]);
    // printf("argv[%d] = %s\n", i, argv[i]);
  }
  assert(!argv[argc]);
  parse_args(argc, argv);
  get_procs();
  // print_tree();
  return 0;
}
