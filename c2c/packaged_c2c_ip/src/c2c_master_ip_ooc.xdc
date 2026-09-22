################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name c2c_clk -period 10 [get_ports c2c_clk]
create_clock -name axi_c2c_selio_rx_diff_clk_in_p_0 -period 10 [get_ports axi_c2c_selio_rx_diff_clk_in_p_0]
create_clock -name axi_c2c_selio_rx_diff_clk_in_n_0 -period 10 [get_ports axi_c2c_selio_rx_diff_clk_in_n_0]

################################################################################