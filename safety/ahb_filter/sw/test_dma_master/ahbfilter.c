#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "ahbfilter.h"


int write_ahb_rule(uint8_t master_id, uint8_t rule_id, uint32_t high_adr, uint32_t low_adr, uint16_t flags){
	uint64_t reg_adr = WG_AHB_FILTER_BASE + 8*(master_id*RULES_PER_MASTER + rule_id);
	volatile uint64_t * reg_ptr = (uint64_t*) reg_adr;
	uint64_t data = (((uint64_t) high_adr)<<40) | (((uint64_t) low_adr)<<16) | (flags << 4) | (master_id & 0xF);
	*reg_ptr = data;
	printf("WG rule has been set for Master[%d], Rule[%d] at Address: %08x, Data: %08x %08x\n", master_id, rule_id, reg_adr, (data>>32)&0xFFFFFFFF, data&0xFFFFFFFF);
	return(0);
}

void print_ahb_rules(uint8_t master_id){
	volatile uint64_t * reg_ptr;
	printf("AHB Filtering rules for master_id=%d\n",master_id);
	for(int rule_id=0;rule_id<8;rule_id++){
		uint64_t reg_adr = WG_AHB_FILTER_BASE + 8*(master_id*RULES_PER_MASTER + rule_id);
		reg_ptr = (uint64_t*) reg_adr;
		uint64_t data = *reg_ptr;
		printf("\tAdr_high=%08xFF Adr_low=%08x00, flags=%02x, master_id=%d\n", (data>>40)&0xFFFFFF, (data>>16)&0xFFFFFF, (data>>4)&0xFFF, data&0xF);
	}
}


void clear_ahb_rules(uint8_t master_id){
	volatile uint64_t * reg_ptr;
	for(int rule_id=0;rule_id<8;rule_id++){
		uint64_t reg_adr = WG_AHB_FILTER_BASE + 8*(master_id*RULES_PER_MASTER + rule_id);
		reg_ptr = (uint64_t*) reg_adr;
		*reg_ptr = 0x0;
	}
	printf("Cleared AHB Filtering rules for master_id=%d\n",master_id);		
}

