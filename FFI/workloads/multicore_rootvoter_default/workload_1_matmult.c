#include <stdio.h>
#include <stdlib.h>
#include "workload.h"

#define ROW 4
#define COL 5
#define N 8

//input data for matrix multiplication
 int M1[ROW][N] = {
	{4927, 	-8612, 	28290, 	-3954, 	22031, 	-12981, -910, 	27877},
	{-15230, 7, 	-11659, 19600, 	9630, 	0, 	7872, 	141},
	{-5803, -14, 	9533, 	-915, 	11249, 	500, 	-5, 	1211},
	{20115, 3783, 	-7469, 	1023, 	-12071, 127, 	-1445,	511}
};

 int M2[N][COL] = {
	{-11484, 	4000, 	79, 	7311, 	256},
	{19598, 	503, 	674, 	-32210, 4010},
	{9580, 		-107, 	-808, 	-4475, 	-656},
	{-1, 		-39, 	128, 	1793, 	-255},	
	{-6092, 	299, 	5309, 	1024, 	701},
	{-25212, 	-130, 	0, 	-1964, 	10371},
	{12381, 	-450, 	765, 	1793, 	2318},
	{-7252, 	-1700, -422, 	-4475, 	5369}	
};


//Matrix multiplication kernel
//inputs are taken from M1 and M2
void matmult(volatile int* res_ptr){
	int i, j, k;
	for(i=0; i < ROW; i++){
		for(j=0; j < COL; j++){
			volatile int * item_ptr = res_ptr + i*COL + j;
			*(item_ptr) = 0;
			for(k = 0; k < N; k++){
				*(item_ptr) += (M1[i][k] * M2[k][j]);
			};
		};
	};	
}


//workload wrapper for fault injection tests
void kernel_wrapper(int mhartid)
{
    VoteResult vote_res;  

    while(1){
		//wait until testbench unlocks the semaphore
        while(*(SYNC_BUF ) == 0x0){ };

		//The RootVoter is initialized by only one of the cores (core[0])
		//It must be reinitialized each time before starting the execution of protected (fail safe) code
        //voting mode = 2oo2 (2 out of 2 cores must agree on results)
		//timeout = 10 millions of clock cycles (0.1 sec at 100 Mhz)
        if(mhartid==0){
            RVC_reset(&RVC0, 0x22, 10000000);
        }
		
		
		//initialization of RootVoter triggers fault injection flag in the FFI core		
		//this flag is represented by a Config register of the rootvoter, which routed to the FFI core over GPIO 
		//After receiving the fault injection command from the host
		//the FFI core awaits for non-zero value of the fault injection flag from the NOEL
		//once the flag is activated, FFI core injects the fault (after a random delay for transient fault models)


        //clean-up the results buffer before processing
        for(int i=0; i<RES_ITEMS; i++){
            *(RES_PTR[mhartid] + i) = 0;
        }

        //execute the kernel (obtain processing results)
        matmult(RES_PTR[mhartid]);

      
        //calculate checksum for the resulting array
        uint32_t dataset = crc32_digest((uint8_t *) (RES_PTR[mhartid]), sizeof(uint32_t)*RES_ITEMS); 


        //upload the checksum to the Rootvoter
		//result of each CPU core (hart) is logically mapped into its dedicated dataset register 
		//index of dataset register equals mhartid of CPU core (core[0] --> dataset_reg[0], core[1] --> dataset_reg[1]...)
        RVC_load_dataset(&RVC0, mhartid, dataset);	


		//Under normal conditions (fault-free run) 
		//all datasets must be sumbitted to the rootvoter before the predefined timeout, defined in RVC_reset(...) 
		//and add datasets must be equal.
		//Under fault injection run some datasets may become incorrect (signalled failure)
		//or missing (timeout failure)

		//Each core can check voting results
		vote_res = RVC_vote(&RVC0);
		
		
		
		//Let use the stdout only to core[0].
		//IMPORTANT: Don't print anything to stdout when doing FFI tests (comment all printfs)
		//since FFI tests require GRMON to execute workloads in detached mode, in which stdout is not forwarded to console		
		/*
		if(mhartid==0){
			print_vote_result(&vote_res);
		}
		*/
		
		//The first core that reaches this execution point should clear the semaphore
        *(SYNC_BUF ) = 0x0;
                
    }

}








