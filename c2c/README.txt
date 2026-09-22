SELENE Virtex UltraScale Plus VCU118 board Design 
###########################################################################################################

Information on the VCU118 at:

https://www.xilinx.com/products/boards-and-kits/vcu118.html

----------------------------------------------------------
The design has been tested with the following tools:

- Mentor questasim 2021.3
- Vivado 2020.2
- The latest grmon version (both pro and eval) available at Cobham Gaisler website : 
https://www.gaisler.com/index.php/downloads/debug-tools

===========================================================================================================

			BITSTREAM GENERATION for SELENE with the Chip2Chip IP Integrated

===========================================================================================================

As <selene hw repo>/interconnect/axi and <selene hw repo>/interconnect/common\_cells are submodule, 
the SELENE hardware repository needs to be cloned recursively.
As a preparation step to synchronize and update the submodules, the following git commands can be executed 
from toplevel of the working tree, in SELENE hardware repository.

	git submodule sync --recursive
	git submodule update --init --recursive
	

cd /path/to/repo/selene-hardware/selene-soc/selene-xilinx-vcu118

To run synthesys and P&R through the GUI: (manual integration of the packaged Chip2Chip to the IP Repo in Vivado)
 make selene-vivado-launch
 
This creates and opens the Vivado project. 
Follow the next sections before starting Bitstream Generation from GUI:

===========================================================================================================

			Chip2Chip IP Block Design Packaging

===========================================================================================================

The TCL script (create_c2c_bd.tcl) already creates a Vivado project with the AXI Chip2Chip block design — have that project open or ready to open.

=> Step 1: Open the Project
Run your TCL script to create/open the C2C project:

source create_c2c_project.tcl

=> Step 2: Create an HDL Wrapper for the Block Design
Vivado needs a top-level HDL wrapper over the block diagram before packaging:

1. In Sources, right-click your block design (.bd file)
2. Select Create HDL Wrapper
3. Choose "Let Vivado manage wrapper and auto-update"
4. Click OK

This generates a VHDL/Verilog wrapper — this becomes the top-level entity of your IP (e.g. c2c_master_ip_wrapper_0.vhd).

=> Step 3: Launch the Package IP Wizard
Go to Tools → Create and Package New IP...

In the wizard:

1. Select "Package your current project"
2. Click Next
3. Set the IP location — the directory where the packaged IP will be saved (this is your future IP repo path, e.g. ip_repo/c2c_master_ip/)
4. Check "Include .xci files" if your block design uses sub-IPs (like the AXI C2C core itself)
5. Click Next → Finish

=> Step 4: Fill in IP Identification (just common things like Vendor, Library, Version etc)

=> Step 5: Review All IP Packaging Sections (just go through each tab on the left panel)

=> Step 6: Package the IP (in the Review and Package tab just click "Package IP")

This generates the component.xml and the full IP-XACT directory structure at the location you specified in Step 3.

===========================================================================================================

			Chip2Chip IP Integration Steps

===========================================================================================================

This is a standard Vivado workflow: adding a custom IP repository to a project so Vivado recognizes the IP. The steps are:

=> Step 1: Add C2C to the IP Repository (GUI)

Method 1: Via Vivado GUI — IP Repository

1. In Vivado, go to Tools → Settings (or Project Settings)
2. Navigate to IP → Repository
3. Click the "+" button to add a new IP repository path
4. Browse to the directory where the packaged IP resides (the folder that contains the component.xml file)
5. Click OK/Apply — Vivado will scan and recognize the IP
6. The IP now appears in the IP Catalog  

Method 2: Via Tcl Script (for automation)

set_property ip_repo_paths {/path/to/your/packaged_ip_dir} [current_project]
update_ip_catalog


=> Step2: Instantiate / Add the IP to the Project

Since this is a pure RTL/VHDL instantiation (entity xil_defaultlib.c2c_master_ip_wrapper_0), you need the IP's source files compiled into the project — not just the catalog entry. Two sub-options:

Option A — Use the IP Catalog to generate an XCI (recommended)

1. In the IP Catalog, find your c2c_master_ip_wrapper IP.
2. Double-click it → configure parameters → click Generate.
3. This creates a .xci file and generates all output products (RTL sources, stubs, etc.) under <project>.srcs/sources_1/ip/.
4. Vivado automatically adds these to the project — your VHDL entity reference in selene_core.vhd will then resolve correctly at synthesis.

Option B — Add the XCI directly (if already generated elsewhere)
If you already have a .xci file from a previous project:

add_files -norecurse /path/to/c2c_master_ip_wrapper_0/c2c_master_ip_wrapper_0.xci
generate_target all [get_files c2c_master_ip_wrapper_0.xci]


=> Step 3: Verify Synthesis Resolution

After adding, confirm the entity is visible to synthesis:

# Check that the IP sources are compiled in xil_defaultlib
report_compile_order -used_in synthesis

Your c2c_master_ip_wrapper_0 entity should appear in the compile order under xil_defaultlib. (usually top of printed info)

You can now run Generate Bitstream from Vivado GUI.

Debug:
If you get this error during synthesis:

[Synth 8-5826] no such design unit 'c2c_master_ip_wrapper_0' in library 'xil_defaultlib'
[Synth 8-285] failed synthesizing module 'selene_core' 

The easiest way I found to solve this issue: from Project Setting to change Target Language from Verlog to VHDL.


Disclaimer:
This entire process could be automated into SELENE's make flow but at the moment this is of lower priority.


