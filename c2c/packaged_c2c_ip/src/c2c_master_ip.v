//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Wed Mar  4 19:49:27 2026
//Host        : tmdu185u.automotive-wan.com running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target c2c_master_ip.bd
//Design      : c2c_master_ip
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "c2c_master_ip,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=c2c_master_ip,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=7,synth_mode=Global}" *) (* HW_HANDOFF = "c2c_master_ip.hwdef" *) 
module c2c_master_ip
   (GPIO_LED_0,
    GPIO_LED_1,
    GPIO_LED_2,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arregion,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awregion,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    axi_c2c_selio_rx_data_in_0,
    axi_c2c_selio_rx_diff_clk_in_n_0,
    axi_c2c_selio_rx_diff_clk_in_p_0,
    axi_c2c_selio_tx_data_out_0,
    axi_c2c_selio_tx_diff_clk_out_n_0,
    axi_c2c_selio_tx_diff_clk_out_p_0,
    c2c_clk,
    c2c_rst,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arcache,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_arregion,
    s_axi_arsize,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awregion,
    s_axi_awsize,
    s_axi_awvalid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wvalid);
  output GPIO_LED_0;
  output GPIO_LED_1;
  output GPIO_LED_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2c_master_ip_clk_in1_0, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]M_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *) output [1:0]M_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *) output [3:0]M_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *) output [7:0]M_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *) output [0:0]M_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]M_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARQOS" *) output [3:0]M_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input M_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREGION" *) output [3:0]M_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *) output [2:0]M_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output M_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) output [31:0]M_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *) output [1:0]M_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *) output [3:0]M_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *) output [7:0]M_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *) output [0:0]M_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]M_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWQOS" *) output [3:0]M_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input M_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREGION" *) output [3:0]M_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *) output [2:0]M_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output M_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output M_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]M_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input M_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [127:0]M_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *) input M_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) output M_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]M_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input M_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [127:0]M_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *) output M_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input M_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [15:0]M_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output M_AXI_wvalid;
  input [14:0]axi_c2c_selio_rx_data_in_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AXI_C2C_SELIO_RX_DIFF_CLK_IN_N_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AXI_C2C_SELIO_RX_DIFF_CLK_IN_N_0, CLK_DOMAIN c2c_master_ip_axi_c2c_selio_rx_diff_clk_in_n_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input axi_c2c_selio_rx_diff_clk_in_n_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AXI_C2C_SELIO_RX_DIFF_CLK_IN_P_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AXI_C2C_SELIO_RX_DIFF_CLK_IN_P_0, CLK_DOMAIN c2c_master_ip_axi_c2c_selio_rx_diff_clk_in_p_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input axi_c2c_selio_rx_diff_clk_in_p_0;
  output [14:0]axi_c2c_selio_tx_data_out_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AXI_C2C_SELIO_TX_DIFF_CLK_OUT_N_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AXI_C2C_SELIO_TX_DIFF_CLK_OUT_N_0, CLK_DOMAIN c2c_master_ip_axi_chip2chip_0_0_axi_c2c_selio_tx_diff_clk_out_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) output axi_c2c_selio_tx_diff_clk_out_n_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AXI_C2C_SELIO_TX_DIFF_CLK_OUT_P_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AXI_C2C_SELIO_TX_DIFF_CLK_OUT_P_0, CLK_DOMAIN c2c_master_ip_axi_chip2chip_0_0_axi_c2c_selio_tx_diff_clk_out_p, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) output axi_c2c_selio_tx_diff_clk_out_p_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C2C_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C2C_CLK, ASSOCIATED_BUSIF s_axi:M_AXI, ASSOCIATED_RESET c2c_rst, CLK_DOMAIN c2c_master_ip_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input c2c_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.C2C_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.C2C_RST, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input c2c_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2c_master_ip_clk_in1_0, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARBURST" *) input [1:0]s_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARCACHE" *) input [3:0]s_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLEN" *) input [7:0]s_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLOCK" *) input [0:0]s_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARQOS" *) input [3:0]s_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREGION" *) input [3:0]s_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARSIZE" *) input [2:0]s_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWBURST" *) input [1:0]s_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWCACHE" *) input [3:0]s_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLEN" *) input [7:0]s_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLOCK" *) input [0:0]s_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWQOS" *) input [3:0]s_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREGION" *) input [3:0]s_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWSIZE" *) input [2:0]s_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [127:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RLAST" *) output s_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *) input [127:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WLAST" *) input s_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *) input [15:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *) input s_axi_wvalid;

  wire [14:0]axi_c2c_selio_rx_data_in_0_1;
  wire axi_c2c_selio_rx_diff_clk_in_n_0_1;
  wire axi_c2c_selio_rx_diff_clk_in_p_0_1;
  wire axi_chip2chip_0_axi_c2c_link_error_out;
  wire axi_chip2chip_0_axi_c2c_link_status_out;
  wire axi_chip2chip_0_axi_c2c_multi_bit_error_out;
  wire [14:0]axi_chip2chip_0_axi_c2c_selio_tx_data_out;
  wire axi_chip2chip_0_axi_c2c_selio_tx_diff_clk_out_n;
  wire axi_chip2chip_0_axi_c2c_selio_tx_diff_clk_out_p;
  wire [31:0]axi_chip2chip_0_m_axi_lite_ARADDR;
  wire [1:0]axi_chip2chip_0_m_axi_lite_ARPROT;
  wire axi_chip2chip_0_m_axi_lite_ARREADY;
  wire axi_chip2chip_0_m_axi_lite_ARVALID;
  wire [31:0]axi_chip2chip_0_m_axi_lite_AWADDR;
  wire [1:0]axi_chip2chip_0_m_axi_lite_AWPROT;
  wire axi_chip2chip_0_m_axi_lite_AWREADY;
  wire axi_chip2chip_0_m_axi_lite_AWVALID;
  wire axi_chip2chip_0_m_axi_lite_BREADY;
  wire [1:0]axi_chip2chip_0_m_axi_lite_BRESP;
  wire axi_chip2chip_0_m_axi_lite_BVALID;
  wire [31:0]axi_chip2chip_0_m_axi_lite_RDATA;
  wire axi_chip2chip_0_m_axi_lite_RREADY;
  wire [1:0]axi_chip2chip_0_m_axi_lite_RRESP;
  wire axi_chip2chip_0_m_axi_lite_RVALID;
  wire [31:0]axi_chip2chip_0_m_axi_lite_WDATA;
  wire axi_chip2chip_0_m_axi_lite_WREADY;
  wire [3:0]axi_chip2chip_0_m_axi_lite_WSTRB;
  wire axi_chip2chip_0_m_axi_lite_WVALID;
  wire [31:0]axi_dwidth_converter_0_M_AXI_ARADDR;
  wire [1:0]axi_dwidth_converter_0_M_AXI_ARBURST;
  wire [3:0]axi_dwidth_converter_0_M_AXI_ARCACHE;
  wire [7:0]axi_dwidth_converter_0_M_AXI_ARLEN;
  wire [0:0]axi_dwidth_converter_0_M_AXI_ARLOCK;
  wire [2:0]axi_dwidth_converter_0_M_AXI_ARPROT;
  wire [3:0]axi_dwidth_converter_0_M_AXI_ARQOS;
  wire axi_dwidth_converter_0_M_AXI_ARREADY;
  wire [3:0]axi_dwidth_converter_0_M_AXI_ARREGION;
  wire [2:0]axi_dwidth_converter_0_M_AXI_ARSIZE;
  wire axi_dwidth_converter_0_M_AXI_ARVALID;
  wire [31:0]axi_dwidth_converter_0_M_AXI_AWADDR;
  wire [1:0]axi_dwidth_converter_0_M_AXI_AWBURST;
  wire [3:0]axi_dwidth_converter_0_M_AXI_AWCACHE;
  wire [7:0]axi_dwidth_converter_0_M_AXI_AWLEN;
  wire [0:0]axi_dwidth_converter_0_M_AXI_AWLOCK;
  wire [2:0]axi_dwidth_converter_0_M_AXI_AWPROT;
  wire [3:0]axi_dwidth_converter_0_M_AXI_AWQOS;
  wire axi_dwidth_converter_0_M_AXI_AWREADY;
  wire [3:0]axi_dwidth_converter_0_M_AXI_AWREGION;
  wire [2:0]axi_dwidth_converter_0_M_AXI_AWSIZE;
  wire axi_dwidth_converter_0_M_AXI_AWVALID;
  wire axi_dwidth_converter_0_M_AXI_BREADY;
  wire [1:0]axi_dwidth_converter_0_M_AXI_BRESP;
  wire axi_dwidth_converter_0_M_AXI_BVALID;
  wire [127:0]axi_dwidth_converter_0_M_AXI_RDATA;
  wire axi_dwidth_converter_0_M_AXI_RLAST;
  wire axi_dwidth_converter_0_M_AXI_RREADY;
  wire [1:0]axi_dwidth_converter_0_M_AXI_RRESP;
  wire axi_dwidth_converter_0_M_AXI_RVALID;
  wire [127:0]axi_dwidth_converter_0_M_AXI_WDATA;
  wire axi_dwidth_converter_0_M_AXI_WLAST;
  wire axi_dwidth_converter_0_M_AXI_WREADY;
  wire [15:0]axi_dwidth_converter_0_M_AXI_WSTRB;
  wire axi_dwidth_converter_0_M_AXI_WVALID;
  wire [31:0]axi_dwidth_converter_1_M_AXI_ARADDR;
  wire [1:0]axi_dwidth_converter_1_M_AXI_ARBURST;
  wire [7:0]axi_dwidth_converter_1_M_AXI_ARLEN;
  wire axi_dwidth_converter_1_M_AXI_ARREADY;
  wire [2:0]axi_dwidth_converter_1_M_AXI_ARSIZE;
  wire axi_dwidth_converter_1_M_AXI_ARVALID;
  wire [31:0]axi_dwidth_converter_1_M_AXI_AWADDR;
  wire [1:0]axi_dwidth_converter_1_M_AXI_AWBURST;
  wire [7:0]axi_dwidth_converter_1_M_AXI_AWLEN;
  wire axi_dwidth_converter_1_M_AXI_AWREADY;
  wire [2:0]axi_dwidth_converter_1_M_AXI_AWSIZE;
  wire axi_dwidth_converter_1_M_AXI_AWVALID;
  wire axi_dwidth_converter_1_M_AXI_BREADY;
  wire [1:0]axi_dwidth_converter_1_M_AXI_BRESP;
  wire axi_dwidth_converter_1_M_AXI_BVALID;
  wire [31:0]axi_dwidth_converter_1_M_AXI_RDATA;
  wire axi_dwidth_converter_1_M_AXI_RLAST;
  wire axi_dwidth_converter_1_M_AXI_RREADY;
  wire [1:0]axi_dwidth_converter_1_M_AXI_RRESP;
  wire axi_dwidth_converter_1_M_AXI_RVALID;
  wire [31:0]axi_dwidth_converter_1_M_AXI_WDATA;
  wire axi_dwidth_converter_1_M_AXI_WLAST;
  wire axi_dwidth_converter_1_M_AXI_WREADY;
  wire [3:0]axi_dwidth_converter_1_M_AXI_WSTRB;
  wire axi_dwidth_converter_1_M_AXI_WVALID;
  wire [31:0]axi_protocol_convert_0_M_AXI_ARADDR;
  wire [1:0]axi_protocol_convert_0_M_AXI_ARBURST;
  wire [3:0]axi_protocol_convert_0_M_AXI_ARCACHE;
  wire [7:0]axi_protocol_convert_0_M_AXI_ARLEN;
  wire [0:0]axi_protocol_convert_0_M_AXI_ARLOCK;
  wire [2:0]axi_protocol_convert_0_M_AXI_ARPROT;
  wire [3:0]axi_protocol_convert_0_M_AXI_ARQOS;
  wire axi_protocol_convert_0_M_AXI_ARREADY;
  wire [3:0]axi_protocol_convert_0_M_AXI_ARREGION;
  wire [2:0]axi_protocol_convert_0_M_AXI_ARSIZE;
  wire axi_protocol_convert_0_M_AXI_ARVALID;
  wire [31:0]axi_protocol_convert_0_M_AXI_AWADDR;
  wire [1:0]axi_protocol_convert_0_M_AXI_AWBURST;
  wire [3:0]axi_protocol_convert_0_M_AXI_AWCACHE;
  wire [7:0]axi_protocol_convert_0_M_AXI_AWLEN;
  wire [0:0]axi_protocol_convert_0_M_AXI_AWLOCK;
  wire [2:0]axi_protocol_convert_0_M_AXI_AWPROT;
  wire [3:0]axi_protocol_convert_0_M_AXI_AWQOS;
  wire axi_protocol_convert_0_M_AXI_AWREADY;
  wire [3:0]axi_protocol_convert_0_M_AXI_AWREGION;
  wire [2:0]axi_protocol_convert_0_M_AXI_AWSIZE;
  wire axi_protocol_convert_0_M_AXI_AWVALID;
  wire axi_protocol_convert_0_M_AXI_BREADY;
  wire [1:0]axi_protocol_convert_0_M_AXI_BRESP;
  wire axi_protocol_convert_0_M_AXI_BVALID;
  wire [31:0]axi_protocol_convert_0_M_AXI_RDATA;
  wire axi_protocol_convert_0_M_AXI_RLAST;
  wire axi_protocol_convert_0_M_AXI_RREADY;
  wire [1:0]axi_protocol_convert_0_M_AXI_RRESP;
  wire axi_protocol_convert_0_M_AXI_RVALID;
  wire [31:0]axi_protocol_convert_0_M_AXI_WDATA;
  wire axi_protocol_convert_0_M_AXI_WLAST;
  wire axi_protocol_convert_0_M_AXI_WREADY;
  wire [3:0]axi_protocol_convert_0_M_AXI_WSTRB;
  wire axi_protocol_convert_0_M_AXI_WVALID;
  wire clk_in1_1;
  wire clk_wiz_0_clk_out1;
  wire ext_reset_in_1;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [31:0]s_axi_1_ARADDR;
  wire [1:0]s_axi_1_ARBURST;
  wire [3:0]s_axi_1_ARCACHE;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [3:0]s_axi_1_ARREGION;
  wire [2:0]s_axi_1_ARSIZE;
  wire s_axi_1_ARVALID;
  wire [31:0]s_axi_1_AWADDR;
  wire [1:0]s_axi_1_AWBURST;
  wire [3:0]s_axi_1_AWCACHE;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [3:0]s_axi_1_AWREGION;
  wire [2:0]s_axi_1_AWSIZE;
  wire s_axi_1_AWVALID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire s_axi_1_BVALID;
  wire [127:0]s_axi_1_RDATA;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire s_axi_1_RVALID;
  wire [127:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [15:0]s_axi_1_WSTRB;
  wire s_axi_1_WVALID;

  assign GPIO_LED_0 = axi_chip2chip_0_axi_c2c_link_status_out;
  assign GPIO_LED_1 = axi_chip2chip_0_axi_c2c_multi_bit_error_out;
  assign GPIO_LED_2 = axi_chip2chip_0_axi_c2c_link_error_out;
  assign M_AXI_araddr[31:0] = axi_dwidth_converter_0_M_AXI_ARADDR;
  assign M_AXI_arburst[1:0] = axi_dwidth_converter_0_M_AXI_ARBURST;
  assign M_AXI_arcache[3:0] = axi_dwidth_converter_0_M_AXI_ARCACHE;
  assign M_AXI_arlen[7:0] = axi_dwidth_converter_0_M_AXI_ARLEN;
  assign M_AXI_arlock[0] = axi_dwidth_converter_0_M_AXI_ARLOCK;
  assign M_AXI_arprot[2:0] = axi_dwidth_converter_0_M_AXI_ARPROT;
  assign M_AXI_arqos[3:0] = axi_dwidth_converter_0_M_AXI_ARQOS;
  assign M_AXI_arregion[3:0] = axi_dwidth_converter_0_M_AXI_ARREGION;
  assign M_AXI_arsize[2:0] = axi_dwidth_converter_0_M_AXI_ARSIZE;
  assign M_AXI_arvalid = axi_dwidth_converter_0_M_AXI_ARVALID;
  assign M_AXI_awaddr[31:0] = axi_dwidth_converter_0_M_AXI_AWADDR;
  assign M_AXI_awburst[1:0] = axi_dwidth_converter_0_M_AXI_AWBURST;
  assign M_AXI_awcache[3:0] = axi_dwidth_converter_0_M_AXI_AWCACHE;
  assign M_AXI_awlen[7:0] = axi_dwidth_converter_0_M_AXI_AWLEN;
  assign M_AXI_awlock[0] = axi_dwidth_converter_0_M_AXI_AWLOCK;
  assign M_AXI_awprot[2:0] = axi_dwidth_converter_0_M_AXI_AWPROT;
  assign M_AXI_awqos[3:0] = axi_dwidth_converter_0_M_AXI_AWQOS;
  assign M_AXI_awregion[3:0] = axi_dwidth_converter_0_M_AXI_AWREGION;
  assign M_AXI_awsize[2:0] = axi_dwidth_converter_0_M_AXI_AWSIZE;
  assign M_AXI_awvalid = axi_dwidth_converter_0_M_AXI_AWVALID;
  assign M_AXI_bready = axi_dwidth_converter_0_M_AXI_BREADY;
  assign M_AXI_rready = axi_dwidth_converter_0_M_AXI_RREADY;
  assign M_AXI_wdata[127:0] = axi_dwidth_converter_0_M_AXI_WDATA;
  assign M_AXI_wlast = axi_dwidth_converter_0_M_AXI_WLAST;
  assign M_AXI_wstrb[15:0] = axi_dwidth_converter_0_M_AXI_WSTRB;
  assign M_AXI_wvalid = axi_dwidth_converter_0_M_AXI_WVALID;
  assign axi_c2c_selio_rx_data_in_0_1 = axi_c2c_selio_rx_data_in_0[14:0];
  assign axi_c2c_selio_rx_diff_clk_in_n_0_1 = axi_c2c_selio_rx_diff_clk_in_n_0;
  assign axi_c2c_selio_rx_diff_clk_in_p_0_1 = axi_c2c_selio_rx_diff_clk_in_p_0;
  assign axi_c2c_selio_tx_data_out_0[14:0] = axi_chip2chip_0_axi_c2c_selio_tx_data_out;
  assign axi_c2c_selio_tx_diff_clk_out_n_0 = axi_chip2chip_0_axi_c2c_selio_tx_diff_clk_out_n;
  assign axi_c2c_selio_tx_diff_clk_out_p_0 = axi_chip2chip_0_axi_c2c_selio_tx_diff_clk_out_p;
  assign axi_dwidth_converter_0_M_AXI_ARREADY = M_AXI_arready;
  assign axi_dwidth_converter_0_M_AXI_AWREADY = M_AXI_awready;
  assign axi_dwidth_converter_0_M_AXI_BRESP = M_AXI_bresp[1:0];
  assign axi_dwidth_converter_0_M_AXI_BVALID = M_AXI_bvalid;
  assign axi_dwidth_converter_0_M_AXI_RDATA = M_AXI_rdata[127:0];
  assign axi_dwidth_converter_0_M_AXI_RLAST = M_AXI_rlast;
  assign axi_dwidth_converter_0_M_AXI_RRESP = M_AXI_rresp[1:0];
  assign axi_dwidth_converter_0_M_AXI_RVALID = M_AXI_rvalid;
  assign axi_dwidth_converter_0_M_AXI_WREADY = M_AXI_wready;
  assign clk_in1_1 = c2c_clk;
  assign ext_reset_in_1 = c2c_rst;
  assign s_axi_1_ARADDR = s_axi_araddr[31:0];
  assign s_axi_1_ARBURST = s_axi_arburst[1:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARREGION = s_axi_arregion[3:0];
  assign s_axi_1_ARSIZE = s_axi_arsize[2:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[31:0];
  assign s_axi_1_AWBURST = s_axi_awburst[1:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWREGION = s_axi_awregion[3:0];
  assign s_axi_1_AWSIZE = s_axi_awsize[2:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[127:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[15:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[127:0] = s_axi_1_RDATA;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  c2c_master_ip_axi_chip2chip_0_0 axi_chip2chip_0
       (.axi_c2c_link_error_out(axi_chip2chip_0_axi_c2c_link_error_out),
        .axi_c2c_link_status_out(axi_chip2chip_0_axi_c2c_link_status_out),
        .axi_c2c_m2s_intr_in({1'b0,1'b0,1'b0,1'b0}),
        .axi_c2c_multi_bit_error_out(axi_chip2chip_0_axi_c2c_multi_bit_error_out),
        .axi_c2c_selio_rx_data_in(axi_c2c_selio_rx_data_in_0_1),
        .axi_c2c_selio_rx_diff_clk_in_n(axi_c2c_selio_rx_diff_clk_in_n_0_1),
        .axi_c2c_selio_rx_diff_clk_in_p(axi_c2c_selio_rx_diff_clk_in_p_0_1),
        .axi_c2c_selio_tx_data_out(axi_chip2chip_0_axi_c2c_selio_tx_data_out),
        .axi_c2c_selio_tx_diff_clk_out_n(axi_chip2chip_0_axi_c2c_selio_tx_diff_clk_out_n),
        .axi_c2c_selio_tx_diff_clk_out_p(axi_chip2chip_0_axi_c2c_selio_tx_diff_clk_out_p),
        .idelay_ref_clk(clk_wiz_0_clk_out1),
        .m_axi_lite_aclk(clk_in1_1),
        .m_axi_lite_araddr(axi_chip2chip_0_m_axi_lite_ARADDR),
        .m_axi_lite_arprot(axi_chip2chip_0_m_axi_lite_ARPROT),
        .m_axi_lite_arready(axi_chip2chip_0_m_axi_lite_ARREADY),
        .m_axi_lite_arvalid(axi_chip2chip_0_m_axi_lite_ARVALID),
        .m_axi_lite_awaddr(axi_chip2chip_0_m_axi_lite_AWADDR),
        .m_axi_lite_awprot(axi_chip2chip_0_m_axi_lite_AWPROT),
        .m_axi_lite_awready(axi_chip2chip_0_m_axi_lite_AWREADY),
        .m_axi_lite_awvalid(axi_chip2chip_0_m_axi_lite_AWVALID),
        .m_axi_lite_bready(axi_chip2chip_0_m_axi_lite_BREADY),
        .m_axi_lite_bresp(axi_chip2chip_0_m_axi_lite_BRESP),
        .m_axi_lite_bvalid(axi_chip2chip_0_m_axi_lite_BVALID),
        .m_axi_lite_rdata(axi_chip2chip_0_m_axi_lite_RDATA),
        .m_axi_lite_rready(axi_chip2chip_0_m_axi_lite_RREADY),
        .m_axi_lite_rresp(axi_chip2chip_0_m_axi_lite_RRESP),
        .m_axi_lite_rvalid(axi_chip2chip_0_m_axi_lite_RVALID),
        .m_axi_lite_wdata(axi_chip2chip_0_m_axi_lite_WDATA),
        .m_axi_lite_wready(axi_chip2chip_0_m_axi_lite_WREADY),
        .m_axi_lite_wstrb(axi_chip2chip_0_m_axi_lite_WSTRB),
        .m_axi_lite_wvalid(axi_chip2chip_0_m_axi_lite_WVALID),
        .s_aclk(clk_in1_1),
        .s_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_araddr(axi_dwidth_converter_1_M_AXI_ARADDR),
        .s_axi_arburst(axi_dwidth_converter_1_M_AXI_ARBURST),
        .s_axi_arlen(axi_dwidth_converter_1_M_AXI_ARLEN),
        .s_axi_arready(axi_dwidth_converter_1_M_AXI_ARREADY),
        .s_axi_arsize(axi_dwidth_converter_1_M_AXI_ARSIZE),
        .s_axi_arvalid(axi_dwidth_converter_1_M_AXI_ARVALID),
        .s_axi_awaddr(axi_dwidth_converter_1_M_AXI_AWADDR),
        .s_axi_awburst(axi_dwidth_converter_1_M_AXI_AWBURST),
        .s_axi_awlen(axi_dwidth_converter_1_M_AXI_AWLEN),
        .s_axi_awready(axi_dwidth_converter_1_M_AXI_AWREADY),
        .s_axi_awsize(axi_dwidth_converter_1_M_AXI_AWSIZE),
        .s_axi_awvalid(axi_dwidth_converter_1_M_AXI_AWVALID),
        .s_axi_bready(axi_dwidth_converter_1_M_AXI_BREADY),
        .s_axi_bresp(axi_dwidth_converter_1_M_AXI_BRESP),
        .s_axi_bvalid(axi_dwidth_converter_1_M_AXI_BVALID),
        .s_axi_rdata(axi_dwidth_converter_1_M_AXI_RDATA),
        .s_axi_rlast(axi_dwidth_converter_1_M_AXI_RLAST),
        .s_axi_rready(axi_dwidth_converter_1_M_AXI_RREADY),
        .s_axi_rresp(axi_dwidth_converter_1_M_AXI_RRESP),
        .s_axi_rvalid(axi_dwidth_converter_1_M_AXI_RVALID),
        .s_axi_wdata(axi_dwidth_converter_1_M_AXI_WDATA),
        .s_axi_wlast(axi_dwidth_converter_1_M_AXI_WLAST),
        .s_axi_wready(axi_dwidth_converter_1_M_AXI_WREADY),
        .s_axi_wstrb(axi_dwidth_converter_1_M_AXI_WSTRB),
        .s_axi_wvalid(axi_dwidth_converter_1_M_AXI_WVALID));
  c2c_master_ip_axi_dwidth_converter_0_0 axi_dwidth_converter_0
       (.m_axi_araddr(axi_dwidth_converter_0_M_AXI_ARADDR),
        .m_axi_arburst(axi_dwidth_converter_0_M_AXI_ARBURST),
        .m_axi_arcache(axi_dwidth_converter_0_M_AXI_ARCACHE),
        .m_axi_arlen(axi_dwidth_converter_0_M_AXI_ARLEN),
        .m_axi_arlock(axi_dwidth_converter_0_M_AXI_ARLOCK),
        .m_axi_arprot(axi_dwidth_converter_0_M_AXI_ARPROT),
        .m_axi_arqos(axi_dwidth_converter_0_M_AXI_ARQOS),
        .m_axi_arready(axi_dwidth_converter_0_M_AXI_ARREADY),
        .m_axi_arregion(axi_dwidth_converter_0_M_AXI_ARREGION),
        .m_axi_arsize(axi_dwidth_converter_0_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_dwidth_converter_0_M_AXI_ARVALID),
        .m_axi_awaddr(axi_dwidth_converter_0_M_AXI_AWADDR),
        .m_axi_awburst(axi_dwidth_converter_0_M_AXI_AWBURST),
        .m_axi_awcache(axi_dwidth_converter_0_M_AXI_AWCACHE),
        .m_axi_awlen(axi_dwidth_converter_0_M_AXI_AWLEN),
        .m_axi_awlock(axi_dwidth_converter_0_M_AXI_AWLOCK),
        .m_axi_awprot(axi_dwidth_converter_0_M_AXI_AWPROT),
        .m_axi_awqos(axi_dwidth_converter_0_M_AXI_AWQOS),
        .m_axi_awready(axi_dwidth_converter_0_M_AXI_AWREADY),
        .m_axi_awregion(axi_dwidth_converter_0_M_AXI_AWREGION),
        .m_axi_awsize(axi_dwidth_converter_0_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_dwidth_converter_0_M_AXI_AWVALID),
        .m_axi_bready(axi_dwidth_converter_0_M_AXI_BREADY),
        .m_axi_bresp(axi_dwidth_converter_0_M_AXI_BRESP),
        .m_axi_bvalid(axi_dwidth_converter_0_M_AXI_BVALID),
        .m_axi_rdata(axi_dwidth_converter_0_M_AXI_RDATA),
        .m_axi_rlast(axi_dwidth_converter_0_M_AXI_RLAST),
        .m_axi_rready(axi_dwidth_converter_0_M_AXI_RREADY),
        .m_axi_rresp(axi_dwidth_converter_0_M_AXI_RRESP),
        .m_axi_rvalid(axi_dwidth_converter_0_M_AXI_RVALID),
        .m_axi_wdata(axi_dwidth_converter_0_M_AXI_WDATA),
        .m_axi_wlast(axi_dwidth_converter_0_M_AXI_WLAST),
        .m_axi_wready(axi_dwidth_converter_0_M_AXI_WREADY),
        .m_axi_wstrb(axi_dwidth_converter_0_M_AXI_WSTRB),
        .m_axi_wvalid(axi_dwidth_converter_0_M_AXI_WVALID),
        .s_axi_aclk(clk_in1_1),
        .s_axi_araddr(axi_protocol_convert_0_M_AXI_ARADDR),
        .s_axi_arburst(axi_protocol_convert_0_M_AXI_ARBURST),
        .s_axi_arcache(axi_protocol_convert_0_M_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arlen(axi_protocol_convert_0_M_AXI_ARLEN),
        .s_axi_arlock(axi_protocol_convert_0_M_AXI_ARLOCK),
        .s_axi_arprot(axi_protocol_convert_0_M_AXI_ARPROT),
        .s_axi_arqos(axi_protocol_convert_0_M_AXI_ARQOS),
        .s_axi_arready(axi_protocol_convert_0_M_AXI_ARREADY),
        .s_axi_arregion(axi_protocol_convert_0_M_AXI_ARREGION),
        .s_axi_arsize(axi_protocol_convert_0_M_AXI_ARSIZE),
        .s_axi_arvalid(axi_protocol_convert_0_M_AXI_ARVALID),
        .s_axi_awaddr(axi_protocol_convert_0_M_AXI_AWADDR),
        .s_axi_awburst(axi_protocol_convert_0_M_AXI_AWBURST),
        .s_axi_awcache(axi_protocol_convert_0_M_AXI_AWCACHE),
        .s_axi_awlen(axi_protocol_convert_0_M_AXI_AWLEN),
        .s_axi_awlock(axi_protocol_convert_0_M_AXI_AWLOCK),
        .s_axi_awprot(axi_protocol_convert_0_M_AXI_AWPROT),
        .s_axi_awqos(axi_protocol_convert_0_M_AXI_AWQOS),
        .s_axi_awready(axi_protocol_convert_0_M_AXI_AWREADY),
        .s_axi_awregion(axi_protocol_convert_0_M_AXI_AWREGION),
        .s_axi_awsize(axi_protocol_convert_0_M_AXI_AWSIZE),
        .s_axi_awvalid(axi_protocol_convert_0_M_AXI_AWVALID),
        .s_axi_bready(axi_protocol_convert_0_M_AXI_BREADY),
        .s_axi_bresp(axi_protocol_convert_0_M_AXI_BRESP),
        .s_axi_bvalid(axi_protocol_convert_0_M_AXI_BVALID),
        .s_axi_rdata(axi_protocol_convert_0_M_AXI_RDATA),
        .s_axi_rlast(axi_protocol_convert_0_M_AXI_RLAST),
        .s_axi_rready(axi_protocol_convert_0_M_AXI_RREADY),
        .s_axi_rresp(axi_protocol_convert_0_M_AXI_RRESP),
        .s_axi_rvalid(axi_protocol_convert_0_M_AXI_RVALID),
        .s_axi_wdata(axi_protocol_convert_0_M_AXI_WDATA),
        .s_axi_wlast(axi_protocol_convert_0_M_AXI_WLAST),
        .s_axi_wready(axi_protocol_convert_0_M_AXI_WREADY),
        .s_axi_wstrb(axi_protocol_convert_0_M_AXI_WSTRB),
        .s_axi_wvalid(axi_protocol_convert_0_M_AXI_WVALID));
  c2c_master_ip_axi_dwidth_converter_1_1 axi_dwidth_converter_1
       (.m_axi_araddr(axi_dwidth_converter_1_M_AXI_ARADDR),
        .m_axi_arburst(axi_dwidth_converter_1_M_AXI_ARBURST),
        .m_axi_arlen(axi_dwidth_converter_1_M_AXI_ARLEN),
        .m_axi_arready(axi_dwidth_converter_1_M_AXI_ARREADY),
        .m_axi_arsize(axi_dwidth_converter_1_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_dwidth_converter_1_M_AXI_ARVALID),
        .m_axi_awaddr(axi_dwidth_converter_1_M_AXI_AWADDR),
        .m_axi_awburst(axi_dwidth_converter_1_M_AXI_AWBURST),
        .m_axi_awlen(axi_dwidth_converter_1_M_AXI_AWLEN),
        .m_axi_awready(axi_dwidth_converter_1_M_AXI_AWREADY),
        .m_axi_awsize(axi_dwidth_converter_1_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_dwidth_converter_1_M_AXI_AWVALID),
        .m_axi_bready(axi_dwidth_converter_1_M_AXI_BREADY),
        .m_axi_bresp(axi_dwidth_converter_1_M_AXI_BRESP),
        .m_axi_bvalid(axi_dwidth_converter_1_M_AXI_BVALID),
        .m_axi_rdata(axi_dwidth_converter_1_M_AXI_RDATA),
        .m_axi_rlast(axi_dwidth_converter_1_M_AXI_RLAST),
        .m_axi_rready(axi_dwidth_converter_1_M_AXI_RREADY),
        .m_axi_rresp(axi_dwidth_converter_1_M_AXI_RRESP),
        .m_axi_rvalid(axi_dwidth_converter_1_M_AXI_RVALID),
        .m_axi_wdata(axi_dwidth_converter_1_M_AXI_WDATA),
        .m_axi_wlast(axi_dwidth_converter_1_M_AXI_WLAST),
        .m_axi_wready(axi_dwidth_converter_1_M_AXI_WREADY),
        .m_axi_wstrb(axi_dwidth_converter_1_M_AXI_WSTRB),
        .m_axi_wvalid(axi_dwidth_converter_1_M_AXI_WVALID),
        .s_axi_aclk(clk_in1_1),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arburst(s_axi_1_ARBURST),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_arregion(s_axi_1_ARREGION),
        .s_axi_arsize(s_axi_1_ARSIZE),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awburst(s_axi_1_AWBURST),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awregion(s_axi_1_AWREGION),
        .s_axi_awsize(s_axi_1_AWSIZE),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wvalid(s_axi_1_WVALID));
  c2c_master_ip_axi_protocol_convert_0_0 axi_protocol_convert_0
       (.aclk(clk_in1_1),
        .aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_araddr(axi_protocol_convert_0_M_AXI_ARADDR),
        .m_axi_arburst(axi_protocol_convert_0_M_AXI_ARBURST),
        .m_axi_arcache(axi_protocol_convert_0_M_AXI_ARCACHE),
        .m_axi_arlen(axi_protocol_convert_0_M_AXI_ARLEN),
        .m_axi_arlock(axi_protocol_convert_0_M_AXI_ARLOCK),
        .m_axi_arprot(axi_protocol_convert_0_M_AXI_ARPROT),
        .m_axi_arqos(axi_protocol_convert_0_M_AXI_ARQOS),
        .m_axi_arready(axi_protocol_convert_0_M_AXI_ARREADY),
        .m_axi_arregion(axi_protocol_convert_0_M_AXI_ARREGION),
        .m_axi_arsize(axi_protocol_convert_0_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_protocol_convert_0_M_AXI_ARVALID),
        .m_axi_awaddr(axi_protocol_convert_0_M_AXI_AWADDR),
        .m_axi_awburst(axi_protocol_convert_0_M_AXI_AWBURST),
        .m_axi_awcache(axi_protocol_convert_0_M_AXI_AWCACHE),
        .m_axi_awlen(axi_protocol_convert_0_M_AXI_AWLEN),
        .m_axi_awlock(axi_protocol_convert_0_M_AXI_AWLOCK),
        .m_axi_awprot(axi_protocol_convert_0_M_AXI_AWPROT),
        .m_axi_awqos(axi_protocol_convert_0_M_AXI_AWQOS),
        .m_axi_awready(axi_protocol_convert_0_M_AXI_AWREADY),
        .m_axi_awregion(axi_protocol_convert_0_M_AXI_AWREGION),
        .m_axi_awsize(axi_protocol_convert_0_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_protocol_convert_0_M_AXI_AWVALID),
        .m_axi_bready(axi_protocol_convert_0_M_AXI_BREADY),
        .m_axi_bresp(axi_protocol_convert_0_M_AXI_BRESP),
        .m_axi_bvalid(axi_protocol_convert_0_M_AXI_BVALID),
        .m_axi_rdata(axi_protocol_convert_0_M_AXI_RDATA),
        .m_axi_rlast(axi_protocol_convert_0_M_AXI_RLAST),
        .m_axi_rready(axi_protocol_convert_0_M_AXI_RREADY),
        .m_axi_rresp(axi_protocol_convert_0_M_AXI_RRESP),
        .m_axi_rvalid(axi_protocol_convert_0_M_AXI_RVALID),
        .m_axi_wdata(axi_protocol_convert_0_M_AXI_WDATA),
        .m_axi_wlast(axi_protocol_convert_0_M_AXI_WLAST),
        .m_axi_wready(axi_protocol_convert_0_M_AXI_WREADY),
        .m_axi_wstrb(axi_protocol_convert_0_M_AXI_WSTRB),
        .m_axi_wvalid(axi_protocol_convert_0_M_AXI_WVALID),
        .s_axi_araddr(axi_chip2chip_0_m_axi_lite_ARADDR),
        .s_axi_arprot({1'b0,axi_chip2chip_0_m_axi_lite_ARPROT}),
        .s_axi_arready(axi_chip2chip_0_m_axi_lite_ARREADY),
        .s_axi_arvalid(axi_chip2chip_0_m_axi_lite_ARVALID),
        .s_axi_awaddr(axi_chip2chip_0_m_axi_lite_AWADDR),
        .s_axi_awprot({1'b0,axi_chip2chip_0_m_axi_lite_AWPROT}),
        .s_axi_awready(axi_chip2chip_0_m_axi_lite_AWREADY),
        .s_axi_awvalid(axi_chip2chip_0_m_axi_lite_AWVALID),
        .s_axi_bready(axi_chip2chip_0_m_axi_lite_BREADY),
        .s_axi_bresp(axi_chip2chip_0_m_axi_lite_BRESP),
        .s_axi_bvalid(axi_chip2chip_0_m_axi_lite_BVALID),
        .s_axi_rdata(axi_chip2chip_0_m_axi_lite_RDATA),
        .s_axi_rready(axi_chip2chip_0_m_axi_lite_RREADY),
        .s_axi_rresp(axi_chip2chip_0_m_axi_lite_RRESP),
        .s_axi_rvalid(axi_chip2chip_0_m_axi_lite_RVALID),
        .s_axi_wdata(axi_chip2chip_0_m_axi_lite_WDATA),
        .s_axi_wready(axi_chip2chip_0_m_axi_lite_WREADY),
        .s_axi_wstrb(axi_chip2chip_0_m_axi_lite_WSTRB),
        .s_axi_wvalid(axi_chip2chip_0_m_axi_lite_WVALID));
  c2c_master_ip_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_1),
        .clk_out1(clk_wiz_0_clk_out1));
  c2c_master_ip_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(ext_reset_in_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_in1_1));
endmodule
