#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <math.h>

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;

// Copied from the manual
struct fat32hdr {
  u8  BS_jmpBoot[3];
  u8  BS_OEMName[8];
  u16 BPB_BytsPerSec;
  u8  BPB_SecPerClus;
  u16 BPB_RsvdSecCnt;
  u8  BPB_NumFATs;
  u16 BPB_RootEntCnt;
  u16 BPB_TotSec16;
  u8  BPB_Media;
  u16 BPB_FATSz16;
  u16 BPB_SecPerTrk;
  u16 BPB_NumHeads;
  u32 BPB_HiddSec;
  u32 BPB_TotSec32;
  u32 BPB_FATSz32;
  u16 BPB_ExtFlags;
  u16 BPB_FSVer;
  u32 BPB_RootClus;
  u16 BPB_FSInfo;
  u16 BPB_BkBootSec;
  u8  BPB_Reserved[12];
  u8  BS_DrvNum;
  u8  BS_Reserved1;
  u8  BS_BootSig;
  u32 BS_VolID;
  u8  BS_VolLab[11];
  u8  BS_FilSysType[8];
  u8  __padding_1[420];
  u16 Signature_word;
} __attribute__((packed));

struct fat32dent {
  u8  DIR_Name[11];
  u8  DIR_Attr;
  u8  DIR_NTRes;
  u8  DIR_CrtTimeTenth;
  u16 DIR_CrtTime;
  u16 DIR_CrtDate;
  u16 DIR_LastAccDate;
  u16 DIR_FstClusHI;
  u16 DIR_WrtTime;
  u16 DIR_WrtDate;
  u16 DIR_FstClusLO;
  u32 DIR_FileSize;
} __attribute__((packed));

struct LongDirent {
  u8  LDIR_Ord;         /* 0  */       
  u8  LDIR_Name1[10];   /* 1  */             
  u8  LDIR_Attr;        /* 11 */        
  u8  LDIR_Type;        /* 12 */        
  u8  LDIR_Chksum;      /* 13 */          
  u8  LDIR_Name2[12];   /* 14 */             
  u16 LDIR_FstClusLO;   /* 26 */             
  u8  LDIR_Name3[4];    /* 28 */            
}__attribute__((__packed__));

char sha1sum[] = "d60e7d3d2b47d19418af5b0ba52406b86ec6ef83  ";


#define CLUS_INVALID   0xffffff7

#define ATTR_READ_ONLY 0x01
#define ATTR_HIDDEN    0x02
#define ATTR_SYSTEM    0x04
#define ATTR_VOLUME_ID 0x08
#define ATTR_DIRECTORY 0x10
#define ATTR_ARCHIVE   0x20
#define ATTR_LONG_NAME (ATTR_READ_ONLY | ATTR_HIDDEN | ATTR_SYSTEM | ATTR_VOLUME_ID)

void *map_disk(const char *fname);

struct fat32hdr *hdr;

void *idx_to_clus_addr(int N) {  
  int FATSz = (hdr->BPB_FATSz16 != 0) ? hdr->BPB_FATSz16 : hdr->BPB_FATSz32;
  int FATOffset = N * 4;
  int ThisFATSecNum = hdr->BPB_RsvdSecCnt + (FATOffset / hdr->BPB_BytsPerSec);
  return hdr + N * hdr->BPB_BytsPerSec * hdr->BPB_SecPerClus;
}

int is_dir_cluster(struct fat32dent *cluster) {
  printf("debug: %p\n", cluster);
  int ndents = hdr->BPB_BytsPerSec * hdr->BPB_SecPerClus / sizeof(struct fat32dent);
  int empty = 0;
  for (int d = 0; d < ndents; d++) {
    struct fat32dent *dent = cluster + d;
    if (dent->DIR_Name[0] == 0x00) {
      empty = 1;
    }
    if (dent->DIR_Name[0] == 0x00 || 
        dent->DIR_Name[0] == 0xe5 ||
        dent->DIR_Attr & ATTR_HIDDEN) continue;
    else if (dent->DIR_Attr == ATTR_LONG_NAME) {
      if (empty) return 0;
      struct LongDirent *ldent = (struct LongDirent *)dent;
      int Ord = ldent->LDIR_Ord;
      if (Ord & 0x40) Ord -= 0x40;
      if (ldent->LDIR_Type != 0 || ldent->LDIR_FstClusLO != 0) return 0;
      for (int i = Ord; i >= 1; i--) {
        struct LongDirent *ldent = (struct LongDirent *)dent;
        if (d >= ndents) break;
        if (Ord != ldent->LDIR_Ord || ldent->LDIR_Type != 0 || ldent->LDIR_FstClusLO) return 0;
        if (i > 1) {
          d++; dent++;
        }
      }
    }
    else {
      if (empty) return 0;
      if (dent->DIR_NTRes) return 0;
    }
  }
  return 1;
}

int main(int argc, char *argv[]) {
  if (argc < 2) {
    fprintf(stderr, "Usage: %s fs-image\n", argv[0]);
    exit(1);
  }

  setbuf(stdout, NULL);

  assert(sizeof(struct fat32hdr) == 512); // defensive

  // map disk image to memory
  hdr = map_disk(argv[1]);

  // TODO: frecov
  int FATSz = hdr->BPB_FATSz32;
  int TotSec = hdr->BPB_TotSec32;
  int DataSec = TotSec - (hdr->BPB_RsvdSecCnt + (hdr->BPB_NumFATs * FATSz));
  int CountOfCluster = DataSec / hdr->BPB_SecPerClus;


  char filename[1024];

  for (int i = 2; i < CountOfCluster; i++) {
    void *cluster = idx_to_clus_addr(i);
    if (is_dir_cluster(cluster)) {
      int ndents = hdr->BPB_BytsPerSec * hdr->BPB_SecPerClus / sizeof(struct fat32dent);
      for (int d = 0; d < ndents; d++) {
        struct fat32dent *dent = cluster + d;
        if (dent->DIR_Name[0] == 0x00 || 
            dent->DIR_Name[0] == 0xe5 ||
            dent->DIR_Attr & ATTR_HIDDEN) continue;
        else if (dent->DIR_Attr == ATTR_LONG_NAME) {
          struct LongDirent *ldent = (struct LongDirent *)dent;
          int Ord = ldent->LDIR_Ord;
          if (Ord & 0x40) Ord -= 0x40;
          d += Ord;
          if (d - 1 >= ndents) continue;
          int s = 0;
          for (int i = Ord - 1; i >= 0; i--) {
            struct LongDirent *ident = ldent + i;
            for (int j = 0; j < 10; j += 2) {
              filename[s++] = ident->LDIR_Name1[j];
            }
            for (int j = 0; j < 12; j += 2) {
              filename[s++] = ident->LDIR_Name2[j];
            }
            for (int j = 0; j < 4; j += 2) {
              filename[s++] = ident->LDIR_Name3[j];
            }
          }
          filename[s++] = 0;
        }
        else {
          int i = 0, s = 0;
          for (; i < 8 && dent->DIR_Name[i] != ' '; i++) {
            filename[s++] = dent->DIR_Name[i];
          }
          if (dent->DIR_Name[8] != ' ') {
            i = 8; filename[s++] = '.';
            for (; i < 11 && dent->DIR_Name[i]; i++) {
              filename[s++] = dent->DIR_Name[i];
            }
          }
          filename[s++] = 0;
        }
        printf("%s%s\n", sha1sum, filename);
      }
    }
  }

  // file system traversal
  munmap(hdr, hdr->BPB_TotSec32 * hdr->BPB_BytsPerSec);
}

void *map_disk(const char *fname) {
  int fd = open(fname, O_RDWR);

  if (fd < 0) {
    perror(fname);
    goto release;
  }

  off_t size = lseek(fd, 0, SEEK_END);
  if (size == -1) {
    perror(fname);
    goto release;
  }

  struct fat32hdr *hdr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
  if (hdr == (void *)-1) {
    goto release;
  }

  close(fd);

  if (hdr->Signature_word != 0xaa55 ||
      hdr->BPB_TotSec32 * hdr->BPB_BytsPerSec != size) {
    fprintf(stderr, "%s: Not a FAT file image\n", fname);
    goto release;
  }
  return hdr;

release:
  if (fd > 0) {
    close(fd);
  }
  exit(1);
}
