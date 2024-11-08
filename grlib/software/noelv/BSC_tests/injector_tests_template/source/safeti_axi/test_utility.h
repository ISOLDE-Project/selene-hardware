#ifndef __TEST_UTILITY__
#define __TEST_UTILITY__

#include "pmu_hw.h"

#define EVENT_COUNT	(14U) //Up to 32
const crossbar_event_t crossbar_event_table [] = {
//Multicore test 4-core configuration
//    {CROSSBAR_OUTPUT_1,     EVENT_0,    "\033[0;34m Constant High (Clock cycles) \033[0m"},
//    {CROSSBAR_OUTPUT_2,     EVENT_6,    "\033[0;31m Core 0: Data cache miss \033[0m"},
//    {CROSSBAR_OUTPUT_3,     EVENT_2,    "\033[0;34m Instruction count pipeline 0 \033[0m"},
//    {CROSSBAR_OUTPUT_4,     EVENT_4,   "\033[0;34m Core 0: Instruction cache miss \033[0m"},
//    {CROSSBAR_OUTPUT_5,     EVENT_13,   "\033[0;31m Core 1: Data cache miss \033[0m"},
//    {CROSSBAR_OUTPUT_6,     EVENT_33,   "\033[0;31m Contention caused to core 0 due to core 1 AHB accesses \033[0m"},
//    {CROSSBAR_OUTPUT_7,     EVENT_20,   "\033[0;31m Core 2: Data cache miss \033[0m"},
//    {CROSSBAR_OUTPUT_8,     EVENT_36,   "\033[0;31m Contention caused to core 0 due to core 2 AHB accesses \033[0m"},
//    {CROSSBAR_OUTPUT_9,     EVENT_27,   "\033[0;31m Core 3: Data cache miss \033[0m"},
//    {CROSSBAR_OUTPUT_10,    EVENT_39,   "\033[0;31m Contention caused to core 0 due to core 3 AHB accesses \033[0m"}
//Multicore test 6-core configuration
//
    {CROSSBAR_OUTPUT_1,     EVENT_0,    "\033[0;34m Constant High (Clock cycles) \033[0m"},
    {CROSSBAR_OUTPUT_2,     EVENT_6,    "\033[0;32m Core 0: Data cache miss \033[0m"},
    {CROSSBAR_OUTPUT_3,     EVENT_2,    "\033[0;34m Instruction count Core 0 pipeline 0 \033[0m"},
    {CROSSBAR_OUTPUT_4,     EVENT_4,   "\033[0;34m Core 0: Instruction cache miss \033[0m"},
    {CROSSBAR_OUTPUT_5,     EVENT_13,   "\033[0;32m Core 1: Data cache miss \033[0m"},
    //{CROSSBAR_OUTPUT_5,     EVENT_9,   "\033[0;32m Instruction count Core 1 pipeline 0 \033[0m"},
    {CROSSBAR_OUTPUT_6,     EVENT_49,   "\033[0;33m Contention caused to core 0 due to core 1 AHB accesses \033[0m"},
    {CROSSBAR_OUTPUT_7,     EVENT_20,   "\033[0;32m Core 2: Data cache miss \033[0m"},
    {CROSSBAR_OUTPUT_8,     EVENT_54,   "\033[0;33m Contention caused to core 0 due to core 2 AHB accesses \033[0m"},
    {CROSSBAR_OUTPUT_9,     EVENT_27,   "\033[0;32m Core 3: Data cache miss \033[0m"},
    {CROSSBAR_OUTPUT_10,    EVENT_59,   "\033[0;33m Contention caused to core 0 due to core 3 AHB accesses \033[0m"},
    {CROSSBAR_OUTPUT_11,    EVENT_34,   "\033[0;32m Core 4: Data cache miss \033[0m"},
    {CROSSBAR_OUTPUT_12,    EVENT_64,   "\033[0;33m Contention caused to core 0 due to core 4 AHB accesses \033[0m"},
    {CROSSBAR_OUTPUT_13,    EVENT_41,   "\033[0;32m Core 5: Data cache miss \033[0m"},
    {CROSSBAR_OUTPUT_14,    EVENT_69,   "\033[0;33m Contention caused to core 0 due to core 5 AHB accesses \033[0m"}
};


#define LD_L1_HIT           (0U)
#define ST_L1_HIT	    (1U)
#define ST_L2_HIT           (2U)
#define LD_L1_MISS_L2_HIT   (3U)
#define LD_L2_MISS          (4U)
#define ST_L2_MISS          (5U)
#define LD_ST_L2_MISS       (6U)
#define ST_L1_MISS_L2_HIT   (7U)
#define NONE		    (100U)

#define TEST_1              (1U)
#define TEST_2              (2U)
#define TEST_3              (3U)
#define TEST_4              (4U)
#define TEST_5              (5U)

#endif // __TEST_UTILITY__
