Just write whatever program you want on a folder inside of source, add it on
the "bmarks" variable on the Makefile, while also adding the directory of the
libraries your software requires on "incs" and on the .riscv recipe.

The variables at the Makefile can also be used to program easily many things.

----------------------------------------------

make clean
When compiling we need to specify the experiments we launch, if not lines 13-19
in Makefile puts default values
make pmu_ubench.riscv

to run:

After switching the BASE_ADDR in pmu_hw.h looks like the PMU is configured,
However, need to check the counters since looks like something is weird

----------------------------------------------
Instructions:

To compile the software:
  make "source folder".riscv

To translate the riscv binary to srec and put it on the testbench directory:
  make "source folder".srec

To decompile the riscv binary to assembler:
  make "source folder".dump

To do everything (make sure there're no errors in the software or lack of
libraries in the Makefile):
  make "source folder".

To clean generated files by this Makefile:
  make clean
