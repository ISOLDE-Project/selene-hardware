#ifndef GLOBAL_DEFS
#define GLOBAL_DEFS

#define RES_ITEMS 64
#define CORE_DELAY 0
#include "RootVoter.h"
#define SYNC_BUF_ADR 0xD0000

#endif

extern volatile int * RES_PTR[4];
extern volatile int * SYNC_BUF;
extern RootVoterDescriptor RVC0;

void kernel_wrapper(int mhartid);


