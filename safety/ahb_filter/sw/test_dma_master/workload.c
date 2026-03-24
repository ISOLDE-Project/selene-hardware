/*
	Baremetal application illustrating the usage of AHB Filter
	for protecting APBUART from DMA accesses through grdmac2 controller
	grdmac2 master_id = CFG_NCPU+1
*/

#include <stdint.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <bcc/bcc.h>
#include <bcc/bcc_param.h>
#include "grdmac2.h"
#include "ahbfilter.h"


//UART FIFO size implemented in hardware (CFG_UART2_FIFO in config.vhd) 
//should match the constant below
#define UART_FIFO_SIZE 32
#define APBUART_BASE 0xFC0E0000
#define UART_DATA 		(*(volatile unsigned int *)(APBUART_BASE + 0x00))
#define UART_STATUS 	(*(volatile unsigned int *)(APBUART_BASE + 0x04))
#define UART_CONTROL 	(*(volatile unsigned int *)(APBUART_BASE + 0x08))
#define UART_SCALER 	(*(volatile unsigned int *)(APBUART_BASE + 0x0C))
#define PTR32(x) ((uint32_t)(uintptr_t)(x))
static struct grdmac_regs *grdmac0_regs = (struct grdmac_regs *) 0xfc0a0000; 


void uart_init(){ 
	UART_SCALER = 106; 		// baud rate 115200	
	//Use below config for GRMON debug: FIFO available = 1, FIFO debug mode = 1, Flow control = 1, transmitter enable = 1, receiver enable = 1
	UART_CONTROL = 0x80000843;		
	//Use below config for simulation: FIFO available = 1, FIFO debug mode = 0, Flow control = 1, transmitter enable = 1, receiver enable = 1
	//UART_CONTROL = 0x80000043;	
}

//poll until FIFO not full and submit one char to UART data register
void uart_putc(char c) {
	//UART_STATUS[9] - Transmitter FIFO full
	while(UART_STATUS & (0x1 << 9)); 
	UART_DATA = c;
}

void uart_puts(const char *s) {
	while(*s) { 
		uart_putc(*s++); 
	}
}




struct grdmac_desc data_desc;
struct grdmac_cond_desc poll_desc;
uint32_t dma_buf [UART_FIFO_SIZE];


//Transmit characters from *data to UART by means of DMA
void uart_dma_transfer(const char * data, uint32_t len){
	for (uint32_t sp=0;sp<len;sp+=UART_FIFO_SIZE){
		//chars are transferred in chunks of UART_FIFO_SIZE
		uint32_t delta = (len-sp < UART_FIFO_SIZE) ? len-sp : UART_FIFO_SIZE;
		//each char must be transferred individually
		//only lower 8 bits of UART data register are used (Gaisler IP manual chapter 18.7)
		for(uint32_t i=0;i<delta;i++){
			dma_buf[i] = (uint32_t) data[sp+i];
		}
		
		/*
		poll_desc.ctrl   = GRDMAC2_COND_CTRWORD(
			0xFF,   //count
			0xFF,   //intrv
			0x0,    //trtp
			0x0,    //irqe
			0x0,    //errto
			0x0,    //irqn
			0x0,    //bm
			0x1,    //wb
			0x1,    //type Polling
			0x0
		);
		poll_desc.next   = PTR32(&data_desc) | 0x0;
		poll_desc.f_next = PTR32(&poll_desc) | 0x0;
		poll_desc.poll_adr = (uint32_t)(APBUART_BASE + 0x04);
		poll_desc.expd_data = 0x1 << 2;
		poll_desc.cond_mask = 0x1 << 2;
		poll_desc.status = 0;
		*/
		
		
		//TODO: debug the GRDMAC2 conditional descriptor  
		//Currently polling the FIFO empty status by means of CPU
		while((UART_STATUS & 0x4) != 0x4);
		
		data_desc.src  = PTR32(dma_buf); 
		data_desc.dest = APBUART_BASE + 0x00;
		data_desc.ctrl = GRDMAC2_DATA_CTRWORD( 
			delta*sizeof(uint32_t), 
			1,  //destfix
			0,  //srcfix
			0,  //irqe
			0,  //dstbm
			0,  //srcbm
			1,  //wb
			1   
		);
		//data_desc.next = PTR32(&poll_desc) | 0x1;
		data_desc.next = PTR32(NULL) | 0x1;	//last descriptor		
		data_desc.status = 0;
		grdmac2_transfer(grdmac0_regs, &data_desc);	
	}	
}



//Interrupt service routine for AHB FILTER
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




//test string to transfer to APBUART 
char test_arr [] = "AHBFILTER TEST MESSAGE transferred to APB UART through GRDMA\r\n";	


int main(void)
{
	uart_init();	
	uart_puts("Hello from GRLIB APBUART!\r\n");	
		
	int irq_idx = 3; 	//AHB filter irq_idx
	//enabled handling of interrupt from AHB filter
	//alternatively write PLIC enable: set bit 3 in the PLIC register sources[0-31] : context 0, (0xF8002000 -> 0x00000008)
	bcc_int_unmask(irq_idx);
	
	//Once interrupt is enabled, register the interrupt service routine (ISR) handler
    int arg = 0x1;		//indicate the ISR which action to perform upon interrupt 	
    void * isr_handler = bcc_isr_register(irq_idx, isr_ahb_filter, &arg);
	printf("ISR registered for the irq_idx = %d\n", irq_idx);
	
	int ncpu = bcc_get_cpu_count();	
	int dma_master_id = ncpu + 1;
	//Set filetring fules (allowed address ranges) for DMA controller 
	//all addresses are allowed except APBUART0 (0xfc0e0000 to 0xfc0e0100)
	//filtering address ranges are defined with a granularity of 256 bytes 
	write_ahb_rule(dma_master_id, 0, 0xFC0DFF, 0x000000, 0x001); 	//all addresses before the APBUART
	write_ahb_rule(dma_master_id, 1, 0xFFFFFF, 0xFC0E02, 0x001); 	//all addresses after the APBUART
	//try DMA transfer, expected result: blocked APB transaction and asserted interrupt
	uart_dma_transfer(&test_arr[0], sizeof(test_arr));	

	
	//Clear AHB rules and repeat DMA-UART transfer
	clear_ahb_rules(dma_master_id);	
	//try DMA transfer without filtering, expected result: test string printed in grmon terminal
	uart_dma_transfer(&test_arr[0], sizeof(test_arr));
	
    return 0;
}

