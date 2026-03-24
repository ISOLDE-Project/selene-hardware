// AHB filter checks AHB transactions against allowed address ranges (filtering rules) for each supervised AHB master 
// Filtering rules for each master_id are stored in the filterting table as described below
// A table storing filtering rules allocates 128 registers (16 masteres x 8 rules):
// Each rule comprises 64 bits formatted as follows:
//   [63:40]     : Adr-High (24 bits) 
//   [39:16]     : Adr-Low (24 bits) 
//   [15: 5]     : flags: reserved bits
//       [4]     : flags: rule enabled (1) / disabled (0)
//     [3:0]     : hmaster-ID (4 bits: )      
//
//     +0   |   Master[0]  : Rule[0]  
//     +8   |   Master[0]  : Rule[1]  
//  .......................
//    +64   |   Master[1]  : Rule[0]
//    +72   |   Master[1]  : Rule[1]
//  .......................
//  +1016   |   Master[16] : Rule[7]
// AHB FILTER BASE ADDRESS: 0xFC003000 (Memory mapped registers / APB SLAVE)

#ifndef WORLDGUARD_DEFS
#define WORLDGUARD_DEFS

#define WG_AHB_FILTER_BASE 0xFC003000
#define RULES_PER_MASTER 8

int write_ahb_rule(uint8_t master_id, uint8_t rule_id, uint32_t high_adr, uint32_t low_adr, uint16_t flags);
void print_ahb_rules(uint8_t master_id);
void clear_ahb_rules(uint8_t master_id);

#endif
