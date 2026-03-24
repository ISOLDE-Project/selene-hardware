CC           = riscv-gaisler-elf-gcc
CFLAGS       = -g -O0 -qbsp=2020q4  -march=rv64imafd -mabi=lp64d


	
dma:
	$(CC) $(CFLAGS) grdmac2.c ahbfilter.c workload.c -o workload_$@.out
	riscv-gaisler-elf-objcopy -O srec workload_$@.out tmp_$@.srec	
	tclsh ../../../../grlib/bin/padsrec.tcl <tmp_$@.srec >workload_$@.srec
	rm tmp_$@.srec
	
	
all:  dma
	
clean:
	rm -f *.OBJ *.LST *.o *.gch *.out *.hex *.map *.elf *.a *.srec *.s


