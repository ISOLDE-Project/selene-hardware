# SELENE — Virtex UltraScale+ VCU118 Board Design

> More information on the VCU118 at: https://www.xilinx.com/products/boards-and-kits/vcu118.html

---

## Tested Tools

| Tool | Version |
|---|---|
| Mentor QuestaSim | 2021.3 |
| Vivado | 2020.2 |
| GRMON (Pro & Eval) | Latest — [Cobham Gaisler](https://www.gaisler.com/index.php/downloads/debug-tools) |

---

## Bitstream Generation for SELENE with Chip2Chip IP Integrated

Since `<selene hw repo>/interconnect/axi` and `<selene hw repo>/interconnect/common_cells` are submodules,
the SELENE hardware repository must be cloned recursively.

To synchronize and update submodules, run the following from the top level of the SELENE hardware repository:

```bash
git submodule sync --recursive
git submodule update --init --recursive
```

Then navigate to:

```bash
cd /path/to/repo/selene-hardware/selene-soc/selene-xilinx-vcu118
```

To run synthesis and P&R through the GUI:

```bash
make selene-vivado-launch
```

This creates and opens the Vivado project. Follow the sections below before starting Bitstream Generation from the GUI.

---

## Chip2Chip IP Block Design Packaging

Note: 
  A directory with the packaged IP was also added in c2c, where the TCL and README are located. 
  In case it doesn't work for you please follow the steps below!

The TCL script `create_c2c_bd.tcl` already creates a Vivado project with the AXI Chip2Chip block design.

### Step 1 — Open the Project

```tcl
source create_c2c_project.tcl
```

### Step 2 — Create an HDL Wrapper for the Block Design

Vivado needs a top-level HDL wrapper over the block diagram before packaging:

1. In **Sources**, right-click your block design (`.bd` file)
2. Select **Create HDL Wrapper**
3. Choose **"Let Vivado manage wrapper and auto-update"**
4. Click **OK**

This generates a VHDL/Verilog wrapper that becomes the top-level entity of your IP (e.g. `c2c_master_ip_wrapper_0.vhd`).

### Step 3 — Launch the Package IP Wizard

Go to **Tools → Create and Package New IP...**

In the wizard:

1. Select **"Package your current project"**
2. Click **Next**
3. Set the **IP location** — the directory where the packaged IP will be saved (e.g. `ip_repo/c2c_master_ip/`)
4. Check **"Include .xci files"** if your block design uses sub-IPs (like the AXI C2C core itself)
5. Click **Next → Finish**

### Step 4 — Fill in IP Identification

Fill in common fields such as Vendor, Library, and Version.

### Step 5 — Review All IP Packaging Sections

Go through each tab in the left panel.

### Step 6 — Package the IP

In the **Review and Package** tab, click **"Package IP"**.

This generates `component.xml` and the full IP-XACT directory structure at the location specified in Step 3.

---

## Chip2Chip IP Integration Steps

### Step 1 — Add C2C to the IP Repository

**Method 1: Via Vivado GUI**

1. Go to **Tools → Settings** (or Project Settings)
2. Navigate to **IP → Repository**
3. Click **"+"** to add a new IP repository path
4. Browse to the directory containing `component.xml`
5. Click **OK/Apply** — Vivado will scan and recognize the IP
6. The IP now appears in the **IP Catalog**

**Method 2: Via Tcl Script (for automation)**

```tcl
set_property ip_repo_paths {/path/to/your/packaged_ip_dir} [current_project]
update_ip_catalog
```

### Step 2 — Instantiate / Add the IP to the Project

Since this uses a pure RTL/VHDL instantiation (`entity xil_defaultlib.c2c_master_ip_wrapper_0`), the IP's source files must be compiled into the project.

**Option A — Use the IP Catalog to generate an XCI (recommended)**

1. In the **IP Catalog**, find your `c2c_master_ip_wrapper` IP
2. Double-click it → configure parameters → click **Generate**
3. This creates a `.xci` file and generates all output products under `<project>.srcs/sources_1/ip/`
4. Vivado automatically adds these to the project — your VHDL entity reference in `selene_core.vhd` will resolve correctly at synthesis

**Option B — Add an existing XCI directly**

If you already have a `.xci` from a previous project:

```tcl
add_files -norecurse /path/to/c2c_master_ip_wrapper_0/c2c_master_ip_wrapper_0.xci
generate_target all [get_files c2c_master_ip_wrapper_0.xci]
```

### Step 3 — Verify Synthesis Resolution

```tcl
# Check that the IP sources are compiled in xil_defaultlib
report_compile_order -used_in synthesis
```

`c2c_master_ip_wrapper_0` should appear in the compile order under `xil_defaultlib` (usually at the top).

You can now run **Generate Bitstream** from the Vivado GUI.

---

## Troubleshooting

**Error during synthesis:**
```
[Synth 8-5826] no such design unit 'c2c_master_ip_wrapper_0' in library 'xil_defaultlib'
[Synth 8-285] failed synthesizing module 'selene_core'
```

**Fix:** Go to **Project Settings** and change the **Target Language** from **Verilog** to **VHDL**.

---

> **Disclaimer:** This entire process could be automated into SELENE's make flow, but is currently lower priority.
