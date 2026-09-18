
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "grdmac2.h"



void grdmac2_reset(struct grdmac_regs *grdmac_regs) {
  grdmac_regs->ctrl = GRDMAC2_RESET;
}


int grdmac2_transfer(struct grdmac_regs *grdmac_regs,
                     struct grdmac_desc *desc) {
  grdmac_regs->desc = (uint32_t)(uintptr_t)desc;
  grdmac_regs->ctrl |= GRDMAC2_ENABLE;
  //poll status register - Ongoing descriptor queue execution bit (see GRIP.pdf 51.11.1)
  while (grdmac_regs->status & GRDMAC2_STATUS_ONG) {
	//printf("DMA finished\n\r");
  }
  //Check for errors
  if ((grdmac_regs->status & GRDMAC2_STATUS_ERR)) {
	  printf("DMA Error status: %08x\r\n", grdmac_regs->status);
  }
  grdmac2_reset(grdmac_regs);

  return 0;
}

