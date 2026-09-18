#include <stdio.h>
#include <stdlib.h>
#include <bcc/bcc.h>
#include <stdint.h>
#include <malloc.h>
#include "RootVoter.h"
#include "workload.h"



//stack for CPU cores
uint64_t thestack[4][4096 / 8];

//pointers to store processing results for each CPU core (extern variable in workload.h)
volatile int * RES_PTR[4];

//pointer to synchronization and status flags used for communication 
//with the testbech/grmon sctipt (extern variable in workload.h)
volatile int * SYNC_BUF;

RootVoterDescriptor RVC0;

int main(void)
{
	int ncpu, ret, i;
    
	//check the number of CPU cores available in this SoC
	ncpu = bcc_get_cpu_count();	
    if (ncpu < 2) {
        printf("This workload requires at least 2 processors\n");
        exit(0);
    }
	//allocate one memory page for processing results of each CPU core
    for(int i=0;i<ncpu;i++){
        RES_PTR[i] = memalign(4096, RES_ITEMS*sizeof(int));
        printf("Result pointer: core[%i]: %08X\n", i, RES_PTR[i]);
    }
    SYNC_BUF = (int *) SYNC_BUF_ADR;    
	
	//Synchronize with the RootVoter cell
    RVC_sync(&RVC0, RVC0_BASE);    


	//Set entry point (program counter) and stack pointer for for all CPU cores (except main core) 
    for (int i = 1; i < ncpu; i++) {
		//entry point - workload wrapper (defined in matmult.c)
        __bcc_startinfo[i].pc = &kernel_wrapper;
        __bcc_startinfo[i].sp = (uintptr_t) &thestack[i][0];
    }
    
	//Start workload on core[1]
    ret = bcc_start_processor(1);
	//Start workload on core[0] (main core)
    kernel_wrapper(0);        
	
	
	//worloads used in this fault injection test are wrapped into infitinite loop
	//therefore the code below is never executed under normal conditions


    return 0;
}

