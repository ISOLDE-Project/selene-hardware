#include <stdio.h>
#include "util.h"
#include <stdint.h>
#include "injector.h"

#define __USING_IDE__
#define __DEBUG__

// Flush address (L2 uBench)
#define flush_addr  0x07000000
// L2 base address
#define L2_base_addr 0xFFFF0000

  ////////////////////////////////////
 // SafeTI benchmark configuration //
////////////////////////////////////

// Read a write address where the injector attacks
#define attack_addr 0x0A000000
// Maximum transaction/delay SIZE (only power of 2s) to sweep during TUA execution
#define MAX_SIZE 0x01000000


// Scripted descriptor type, size and sweep option from Makefile
// ubench -> 2=ST_L2HIT, 3=LD_L2HIT, 4=LD_L2MISS, 5=ST_L2MISS
// type   -> 1=READ,      2=WRITE
#ifndef  __INJ_TYPE__
  #define __INJ_TYPE__ 0
#endif
#ifndef __INJ_SIZE__
  #define __INJ_SIZE__ 0
#endif
#ifndef __INJ_DELAY__
  #define __INJ_DELAY__ 0
#endif
#ifndef __INJ_COUNT__
  #define __INJ_COUNT__ 0
#endif
#ifndef __INJ_LOOP__
  #define __INJ_LOOP__ 0
#endif
#ifndef __INJ_SELECTOR__
  #define __INJ_SELECTOR__ 0
#endif

// If needed if you do not want to the IDE grais-out the code
#ifndef __CORE__
  #define __CORE__
#endif

//DO NOT REMOVE, USED TO INITIALIZE THE CORES
void thread_entry(int cid, int nc)
{
  return;
}

#ifndef __UBENCH_N_CORES__                // Set number of cores to use during ubench
  #define N_CORES           (6U)          // 4 or 6 (depending on the bitstream configuration)
#else
  #define N_CORES           __UBENCH_N_CORES__
#endif

#if (__FLUSH_METHOD__ == 0)
 #define __FLUSH_NAME__  "No flush"
#elif (__FLUSH_METHOD__ == 1)
 #define __FLUSH_NAME__  "L2 flush flag"
#elif (__FLUSH_METHOD__ == 2)
 #define __FLUSH_NAME__  "1MB LD ubench"
#elif (__FLUSH_METHOD__ == 3)
 #define __FLUSH_NAME__  "1MB ST ubench"
#endif

#if (__INJ_TYPE__ == INJ_OP_DELAY)
 #define __INJ_TYPE_NAME__   "NO OPERATION (DELAY)"
#elif (__INJ_TYPE__ == INJ_OP_READ)
 #define __INJ_TYPE_NAME__   "READS"
#elif (__INJ_TYPE__ == INJ_OP_WRITE)
 #define __INJ_TYPE_NAME__   "WRITES"
#elif (__INJ_TYPE__ == INJ_OP_READ_FIX)
  #define __INJ_TYPE_NAME__  "FIXED ADDRESS READS"
#elif (__INJ_TYPE__ == INJ_OP_WRITE_FIX)
 #define __INJ_TYPE_NAME__   "FIXED ADDRESS WRITES"
#elif (__INJ_TYPE__ == INJ_OP_READ_SEQ)
  #define __INJ_TYPE_NAME__  "SEQUENTIAL ADDRESS READS"
#elif (__INJ_TYPE__ == INJ_OP_WRITE_SEQ)
  #define __INJ_TYPE_NAME__  "SEQUENTIAL ADDRESS WRITES"
#else
 #define __INJ_TYPE_NAME__   "ERROR: DESCRIPTOR TYPE NOT SUPPORTED"
#endif

void inj_program_custom(unsigned int SEL, unsigned int DESC_TYPE, unsigned int SIZE, unsigned int ATTACK_ADDR) {
  unsigned int i;
  inj_reset(SEL);
  inj_reset_counters(SEL);

  for(i = 0; SIZE > 524288; i++) {
    // Here put the descriptor you want to be programmed
    // (SEL, DESC_TYPE, SIZE, DESC_ATTACK_ADDR, COUNT, LAST, INTERRUPTION_EN)
    program_descriptor(SEL, DESC_TYPE, 524288, ATTACK_ADDR+0x80000*i, 0, 0, 0);
    SIZE = SIZE - 524288;
  }
  printf("i = %u\n", i);
  program_descriptor(SEL, DESC_TYPE, SIZE, ATTACK_ADDR+0x80000*i, 0, 1, 0);
  // At last, start traffic injector
  // (SEL, ENABLE, QUEUE_EN, INT_PROG_COMPL, INT_ERROR, INT_NET_ERROR, FREEZE_INT)
  program_configuration(SEL, 1, __INJ_LOOP__, 1, 0, 0, 0);
}

int main(void) {
  #ifdef __CORE__
    int core;
    unsigned int *p;
    //Read mharid csr
    core=read_csr(0xf14);//CSR_MHARTID
    switch(core) {
      case 0:
        break;

      case 1:
        while(N_CORES < 2);
        break;

      case 2:
        while(N_CORES < 3);
        break;

      case 3:
        while(N_CORES < 4);
        break;

      case 4:
        while(N_CORES < 5);
        break;

      case 5:
        while(N_CORES < 6);
        break;

      default:
        while(1);
    }

    switch (core) {
      case 0:
        //CORE 0 CODE
        printf("START EXPERIMENTS\n");
        unsigned int inj_size, inj_delay, inj_count, inj_req_cnt, inj_prog_compl_cnt, L2_access, L2_misses;

        inj_size  = __INJ_SIZE__;
        inj_delay = __INJ_DELAY__;
        inj_count = __INJ_COUNT__;

        // Reset SafeTI counters
        inj_reset_counters(__INJ_SELECTOR__);

        // Write the injector program (sel,type,size,wraddr)
        // 524288 is max size for a single transaction descriptor
        // 0x80100000 PMU, 0xfc085000 SafeTI AXI
        if (inj_size != 0)
          inj_program_custom(__INJ_SELECTOR__, __INJ_TYPE__, inj_size, attack_addr);

        // Let SafeTI do some rounds
        for(unsigned int sleep; sleep < 10000; sleep++);

        //Disable injector while letting to finish any ongoing transaction
        if (inj_size != 0) {
          inj_reset(__INJ_SELECTOR__);
          while(inj_check_run(__INJ_SELECTOR__) != 0) {
            printf("Waiting for injector to stop.\n");
          }
        }

        printf("FINISHED EXPERIMENT\n");
        break;

      case 1:
        //CORE 1 CODE
        //Pointer for Core 1
        while(1);
        break;

      case 2:
        //CORE 2 CODE
        //Pointer for Core 2
        while(1);
        break;

      case 3:
        //CORE 3 CODE
        //Pointer for Core 3
        while(1);
        break;

      case 4:
        //CORE 4 CODE
        //Pointer for Core 4
        while(1);
        break;

      case 5:
        //CORE 5 CODE
        //Pointer for Core 5
        while(1);
        break;
    }

#else
  //This shall never be reached if makefile is setup properly
  while(1)
    printf("__CORE__ not defined\n");
#endif

    return 0;
}
