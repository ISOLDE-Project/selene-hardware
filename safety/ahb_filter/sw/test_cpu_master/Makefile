CC           = riscv-gaisler-elf-gcc
CFLAGS       = -g -O0 -qbsp=2020q4  -march=rv64imafd -mabi=lp64d


multicore:
	$(CC) $(CFLAGS) ahbfilter.c workload.c -o obj_$@.out
	riscv-gaisler-elf-objcopy -O srec obj_$@.out tmp_$@.srec	
	tclsh ../../../../grlib/bin/padsrec.tcl <tmp_$@.srec >hello_multicore.srec
	rm tmp_$@.srec	
	
	
all:  multicore
	
clean:
	rm -f *.OBJ *.LST *.o *.gch *.out *.hex *.map *.elf *.a *.srec *.s


