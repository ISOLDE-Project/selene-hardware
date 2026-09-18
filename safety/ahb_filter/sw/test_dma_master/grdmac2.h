#ifndef GRDMAC2_H
#define GRDMAC2_H

#include <stdint.h>
#include <string.h>


struct grdmac_regs {
  volatile uint32_t ctrl;
  volatile uint32_t status;
  volatile uint32_t timerrstval;
  volatile uint32_t cap;
  volatile uint32_t desc;
};

#define GRDMAC2_ENABLE  (1 << 0)
#define GRDMAC2_RESET (1 << 1)

#define GRDMAC2_STATUS_CMP (1 << 0)
#define GRDMAC2_STATUS_ERR (1 << 1)
#define GRDMAC2_STATUS_ONG (1 << 2)


struct grdmac_desc {
  volatile uint32_t ctrl;
  volatile uint32_t next;
  volatile uint32_t dest;
  volatile uint32_t src;
  volatile uint32_t status;
} __attribute__((__aligned__(2)));

#define GRDMAC2_DATA_CTRWORD(dm_size, dm_destfix, dm_srcfix, dm_irqe, dm_dstbm, dm_srcbm, dm_wb, dm_en) \
   ((dm_size   << 11) | \
    (dm_destfix << 10) | \
    (dm_srcfix  << 9)  | \
    (dm_irqe    << 8)  | \
	(dm_dstbm   << 7)  | \
	(dm_srcbm   << 6)  | \
    (dm_wb      << 5)  | \
    (0          << 1)  | dm_en)




struct grdmac_cond_desc {
  volatile uint32_t ctrl;
  volatile uint32_t next;
  volatile uint32_t f_next;  
  volatile uint32_t poll_adr;
  volatile uint32_t status;
  volatile uint32_t expd_data;
  volatile uint32_t cond_mask;  
} __attribute__((__aligned__(2)));


#define GRDMAC2_COND_CTRWORD(dm_count, dm_intrv, dm_trtp, dm_irqe, dm_errto, dm_irqn, dm_bm, dm_wb, dm_type, dm_en) \
   ((dm_count   << 24) | \
    (dm_intrv   << 16) | \
    (dm_trtp    << 15) | \
    (dm_irqe    << 14) | \
	(dm_errto   << 13) | \
	(dm_irqn    <<  7) | \
    (dm_bm      <<  6) | \
    (dm_wb      <<  5) | \
	(dm_type    <<  1) | dm_en)



void grdmac2_reset(struct grdmac_regs *grdmac_regs);


int grdmac2_transfer(struct grdmac_regs *grdmac_regs, struct grdmac_desc *desc);


#endif