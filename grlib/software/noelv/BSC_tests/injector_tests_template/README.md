This specific "safeti_axi" program is a template of traffic injection test using 
the SafeTI module integrated within the SELENE SoC. Details of the injection are
detailed inside the Makefile under the "Experiment parameters" section.

For more up-to-date information in relation with SafeTI drivers, checkout 
drivers/safeti/injector.c commentaries and source/safeti_axi/main.c example.

----------------------------------------------

make clean
Erase "build" folder.

----------------------------------------------
Instructions:

To compile library drivers to the "build" folder:
  make drivers_

To compile the C code:
  make elf

To compile all:
  make all

To clean generated files by this Makefile:
  make clean

