#include <assert.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>

#define DDR_TOTAL_SIZE 0x10000000
#define DDR_BASE_ADDR ((uintptr_t)0x10000000)

void loader(char *imgfile) {
  /* map some devices into the address space of this program */
  int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
  if (mem_fd == -1) {
    perror("init_map open failed:");
    exit(1);
  }
  void *ddr_base = mmap(NULL, DDR_TOTAL_SIZE, PROT_READ | PROT_WRITE,
                        MAP_SHARED, mem_fd, DDR_BASE_ADDR);
  if (ddr_base == NULL) {
    perror("init_mem mmap failed:");
    close(mem_fd);
    exit(1);
  }

  printf("First Byte 0x%x\n", *(uint32_t *)ddr_base);

  FILE *fp = fopen(imgfile, "rb");
  assert(fp);

  fseek(fp, 0, SEEK_END);
  long size = ftell(fp);
  printf("image size = %ld\n", size);

  fseek(fp, 0, SEEK_SET);
  size_t nr_read = fread(ddr_base, size, 1, fp);
  printf("payload size %zd\n", nr_read);

  fclose(fp);

  munmap((void *)ddr_base, DDR_TOTAL_SIZE);
  close(mem_fd);
}

int main(int argc, char *argv[]) {

  printf("Load %s\n", argv[1]);
  loader(argv[1]);

  return 0;
}