// Filters AHB transactions by the ragnge of addresses (filtering rules) defined by the pages of 256 bytes
// A table storing filtering rules, 16 masteres x 8 rules:
// Each rule 64 bits formatted as follows:
// Adr-High (24 bits, [63:40]) : Adr-Low (24 bits, [39:16]) : Flags (12 bits: [15:4]) : hmaster-ID =  0 (4 bits: [3:0])      
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

#endif
