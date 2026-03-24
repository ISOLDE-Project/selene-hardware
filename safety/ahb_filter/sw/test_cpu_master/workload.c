#include <stdint.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <bcc/bcc.h>
#include <bcc/bcc_param.h>
#include "ahbfilter.h"

#define BASE_ADR_CORE_1 0x1F00000
#define BASE_ADR_CORE_2 0x2F00000


//stack for CPU cores
uint64_t thestack[2][4096 / 8];


void kernel_wrapper(int mhartid)
{
	volatile int * data_ptr_1;
	volatile int * data_ptr_2;

	if(mhartid == 0){
		data_ptr_1 = (int *) (BASE_ADR_CORE_1 + 0x0);
		data_ptr_2 = (int *) (BASE_ADR_CORE_1 + 0x3000000);
	}
	else {
		data_ptr_1 = (int *) (BASE_ADR_CORE_2 + 0x0);
		data_ptr_2 = (int *) (BASE_ADR_CORE_2 + 0x3000000);
	}
	
	/*
	core[0]: WG: 0x1F00000 - 0x1FFFFFF
			 write int32 at 0x1F0000 x8 
			 write int32 at 0x4F0000 x8 
			 write int32 at 0x1F0080 x8
									  
	core[1]: WG: 0x2F00000 - 0x2FFFFFF    
			 write int32 at 0x2F0000 x8 
			 write int32 at 0x5F0000 x8 -- out of range
			 write int32 at 0x2F0080 x8
	*/	
	for(int i=0;i<8;i++){
		*(data_ptr_1 + i) = i+10;
	}
	for(int i=0;i<8;i++){
		*(data_ptr_2 + i) = i+100;
	}
	for(int i=0;i<8;i++){
		*(data_ptr_1 + i + 32) = i+1000;
	}
	
	//block all harts except main hart 0 to prevent them from ebreak 
	while (mhartid != 0);
}





void isr_ahb_filter(void *arg, int source) {
    printf("Detected interrupt from AHB_FILTER (source = %d): request outside the allowed address range\n", source);
	int action = *(int*)arg;
	printf("Requested action: %d\n", action);
	switch(action){
		case 1:
			printf("Reset AHB master: to be implemented\n");
			break;
		case 2:
			printf("Report and exit\n");
			break;
		default:
			printf("Unsupported action\n");		
	}
}





int main(void)
{
	int ncpu, ret, i;
    
	//check the number of CPU cores available in this SoC
	ncpu = bcc_get_cpu_count();	
    if (ncpu < 2) {
        printf("This workload requires at least 2 processors\n");
        exit(0);
    }


	/*SETTING OF WORLDGUARD AHB FILTERING RULES FOR THE CPU CORE 1 (MASTER_ID = 1)
		0x80000000- 0xFFFFFFF - peripheral components and special control registers
		0x0000000 - 0x1000000 - RAM (top 16 Mb)
		0x2F00000 - 0x2FFFFFF - RAM pages accessible from the core 1
	*/	
	printf("Program started: NCPU = %d\n", ncpu);
	// Master_id = 1,  rule_id = 0, adr_high[31:8]] = 0xFFFFFF, adr_low[31:8]] = 0x800000, flags = 0x001
	write_ahb_rule(1, 0, 0xFFFFFF, 0x800000, 0x001); 
	// Master_id = 1,  rule_id = 1, adr_high[31:8]] = 0x010000, adr_low[31:8]] = 0x000000, flags = 0x001
	write_ahb_rule(1, 1, 0x010000, 0x000000, 0x001);
	// Master_id = 1,  rule_id = 2, adr_high[31:8]] = 0x02FFFF, adr_low[31:8]] = 0x02F000, flags = 0x001
	write_ahb_rule(1, 2, 0x02FFFF, 0x02F000, 0x001);
		
	print_ahb_rules(1);
	
	int irq_idx = 3; 	//AHB filter irq_idx
	//enabled handling of interrupt from AHB filter
	//alternatively write PLIC enable: set bit 3 in the PLIC register sources[0-31] : context 0, (0xF8002000 -> 0x00000008)
	bcc_int_unmask(irq_idx);
	
	//Once interrupt is enabled, register the interrupt service routine (ISR) handler
    int arg = 0x1;		//indicate the ISR which action to perform upon interrupt 	
    void * isr_handler = bcc_isr_register(irq_idx, isr_ahb_filter, &arg);
	printf("ISR registered for the irq_idx = %d\n", irq_idx);

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
	

    return 0;
}

