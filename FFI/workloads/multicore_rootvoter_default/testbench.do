#GRMON script to communicate with SELENE DUT
#Author: Ilya Tuzov, Universitat Politecnica de Valencia


variable kernel "/home2/tuil/selene_gitlab/selene-hardware/FFI/workloads/multicore_rootvoter_default/obj_workload_1_matmult.out"

variable SYNC_BUF 0xD0000
variable RVC_BASE 0xfffc0200
variable RES_ADR_C0 0x15000
variable RES_ADR_C1 0x16000


proc DutReset { } {
    global kernel
    #if {[catch {[attach]} er]} { }
    if {[catch {[reset]} er]} { }
    load $kernel
    if {[catch {[detach]} er]} { }
    puts "DUT has been reset"
    return "Status: {OK}"
    after 1000
}



proc cleanup { } {
    global SYNC_BUF  
    global RVC_BASE
    global RES_ADR_C0
    global RES_ADR_C1
    #reset RootVoter
    wmem [expr {$RVC_BASE + 248}] 0xF
    wmem [expr {$SYNC_BUF + 0}]  0x0 
    wmem $RES_ADR_C0 0 0 0 0 0 0 0 0
    wmem $RES_ADR_C1 0 0 0 0 0 0 0 0
    set c0 [silent mem $RES_ADR_C0 1]
    set c1 [silent mem $RES_ADR_C1 1]
    if { ($c0 != 0x0) || ($c1 != 0x0) } { return "Status: {Crash: RAM access}" }
}






proc TestWorkload { goldenrun} { 

    global SYNC_BUF  
    global RVC_BASE
    global RES_ADR_C0
    global RES_ADR_C1
    set refres {0x0181fc2c 0xfe702b83 0x04836f98 0x060b3cd8 0xfea98cf3 0x0606ab8a 0xfc5815e0 0x040ad63c 0xfff21b3a 0x01765db1 0x04094116 0xfea1a315 0x0308f411 0xfb297e47 0x00b71837 0xf54a5806 0x04b9af7a 0xfcb7389d 0x028fd4ff 0x010690a8 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000}
    set ref_rvc_config 0x98968022
    #1. Check initial state

    #2. Run workload (unlock the semaphore)
    wmem [expr {$SYNC_BUF + 0}]  0x1
    #wait for wokload completion (200 ms as timeout)
    after 2000
    #read-back processing results 
    set res_c0 [silent mem $RES_ADR_C0 256]
    set res_c1 [silent mem $RES_ADR_C1 256]
    #check rootvoter state and flags
    set rvc_config [silent mem [expr {$RVC_BASE + 0}] 4]
    set rvc_state [silent mem [expr {$RVC_BASE + 152}] 4]
    set rvc_status [silent mem [expr {$RVC_BASE + 160}] 4]
    set ready_flag [expr $rvc_status & 0x1]
    set timeout [expr ($rvc_status >> 8) & 0xF]
    set failure [expr ($rvc_status >> 24) & 0xF]
    set dataset_0 [silent mem [expr {$RVC_BASE + 8}] 8]
    set dataset_1 [silent mem [expr {$RVC_BASE + 16}] 8]    
    set logres "timeout_stat=$timeout:failure_stat=$failure:res_c0=[lindex $res_c0 0]...[lindex $res_c0 19]:res_c1=[lindex $res_c1 0]...[lindex $res_c1 19]:rvc_state=$rvc_state:rvc_config=$rvc_config:ready_flag=$ready_flag:dataset_0=$dataset_0:dataset_1=$dataset_1"

    #3. Cleanup and check if DUT remains functional
    #lock the semaphore
    wmem [expr {$SYNC_BUF + 0}]  0x0     
    #reset RootVoter
    wmem [expr {$RVC_BASE + 248}] 0xF
    set check_rvc_status [silent mem [expr {$RVC_BASE + 160}] 4]
    set check_rvc_config [silent mem [expr {$RVC_BASE +   0}] 4]
    if { (($check_rvc_status & 0xFFFFFFFF)!= 0x0) || ($check_rvc_config != 0x0) } { return "Status: {Crash: RVC access}" }
    #clean-up results buffer
    wmem $RES_ADR_C0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    wmem $RES_ADR_C1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
    set c0 [silent mem $RES_ADR_C0 1]
    set c1 [silent mem $RES_ADR_C1 1]
    if { ($c0 != 0x0) || ($c1 != 0x0) } { return "Status: {Crash: RAM access}" }
    
    
    
    #4. Save reference results (in case of golden run) 
    #   or determine failure mode (in case of fault injection run)
    if {$goldenrun==1} {
        #Uncomment following to line to obtain golden-run results automatically
        #set refres $res_c0
        return "Status: {Pass}"
    } else {
        if {$ready_flag != 0x1} {
            if {$rvc_config != $ref_rvc_config } {
                return "Status: {Signalled: RVC config error: $logres}"
            } else {            
                return "Status: {Signalled: RVC failure: $logres}"
            }
        } elseif {$timeout != 0x0} {
            return "Status: {Timeout: $logres}"
        } elseif {$failure != 0x0} {
			return "Status: {Signalled: incorrect_result: $logres}"
		} else {
			if { ($res_c0 != $refres) || ($res_c1 != $refres) } {
				return "Status: {SDC: $logres}"
			} else {
                return "Status: {Masked: $logres}"
            }				
		
		}
        
    }
}






# The code below implements communication between the testbench and BAFFI
# Processes connection requests received via sockets
 proc accept {chan addr port} {           
    scan [gets $chan] %d cmd
    set code [catch {
    
        if {$cmd == 1} {
            puts "Running Workload"
            set inf "GRMON: TestWorkload"
            set res [TestWorkload 0]
        } elseif {$cmd == 2} {
            puts "Reset"
            set inf "GRMON: DutReset"
            set res [DutReset]        
        } else {
            set inf "GRMON: Unknown cmd $cmd"
            set res "Status: {Error}"           
        }
        puts $inf
    } errmsg]
    if {$code == 0} {
        puts $chan $res
    } else {
        regsub -all {\n} $errmsg {} c
        puts $chan "Status: {Crash: $c}"
    }
    close $chan                          
 }          



set grmon::settings::echo_result 1
set port 12345
puts "GRMON script started at port=$port"
DutReset
puts "DUT has been initialized"
cleanup
TestWorkload 0
puts "DUT ready"

#socket -server accept $port
#vwait forever




