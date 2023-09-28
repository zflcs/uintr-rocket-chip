################## Compress Bitstream ############################
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN AM13 [get_ports {led[0]}]

set_property PACKAGE_PIN D11 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]
set_property PACKAGE_PIN D10 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]


set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_clk_p]
set_property PACKAGE_PIN AL8 [get_ports sys_clk_clk_p]
set_property PACKAGE_PIN AL7 [get_ports sys_clk_clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_clk_n]
create_clock -period 5.000 -name sys_clk_clk_p -waveform {0.000 2.500} [get_ports sys_clk_clk_p]

set_property PACKAGE_PIN M10 [get_ports mdio_mdc]
set_property PACKAGE_PIN L10 [get_ports mdio_mdio_io]
set_property PACKAGE_PIN R9 [get_ports phy_reset_n]
set_property PACKAGE_PIN AA7 [get_ports rgmii_rxc]
set_property PACKAGE_PIN AA6 [get_ports rgmii_rx_ctl]
set_property PACKAGE_PIN U4 [get_ports {rgmii_rd[0]}]
set_property PACKAGE_PIN U5 [get_ports {rgmii_rd[1]}]
set_property PACKAGE_PIN Y9 [get_ports {rgmii_rd[2]}]
set_property PACKAGE_PIN Y10 [get_ports {rgmii_rd[3]}]
set_property PACKAGE_PIN V3 [get_ports rgmii_txc]
set_property PACKAGE_PIN V4 [get_ports rgmii_tx_ctl]
set_property PACKAGE_PIN AC9 [get_ports {rgmii_td[0]}]
set_property PACKAGE_PIN AB9 [get_ports {rgmii_td[1]}]
set_property PACKAGE_PIN AB5 [get_ports {rgmii_td[2]}]
set_property PACKAGE_PIN AB6 [get_ports {rgmii_td[3]}]

set_property IOSTANDARD LVCMOS18 [get_ports mdio_mdc]
set_property IOSTANDARD LVCMOS18 [get_ports mdio_mdio_io]
set_property IOSTANDARD LVCMOS18 [get_ports phy_reset_n]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_rxc]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_rx_ctl]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_txc]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_tx_ctl]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[3]}]

set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports mdio_mdio_io]


#idelay





create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list system/clk_wiz_0/inst/clk_50M]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 40 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[0]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[1]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[2]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[3]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[4]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[5]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[6]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[7]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[8]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[9]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[10]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[11]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[12]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[13]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[14]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[15]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[16]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[17]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[18]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[19]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[20]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[21]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[22]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[23]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[24]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[25]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[26]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[27]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[28]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[29]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[30]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[31]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[32]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[33]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[34]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[35]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[36]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[37]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[38]} {top/target/tile_prci_domain_2/tile_reset_domain_tile/core/wb_reg_pc[39]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 40 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[0]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[1]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[2]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[3]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[4]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[5]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[6]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[7]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[8]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[9]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[10]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[11]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[12]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[13]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[14]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[15]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[16]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[17]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[18]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[19]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[20]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[21]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[22]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[23]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[24]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[25]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[26]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[27]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[28]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[29]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[30]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[31]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[32]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[33]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[34]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[35]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[36]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[37]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[38]} {top/target/tile_prci_domain/tile_reset_domain_tile/core/wb_reg_pc[39]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 40 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[0]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[1]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[2]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[3]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[4]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[5]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[6]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[7]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[8]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[9]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[10]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[11]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[12]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[13]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[14]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[15]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[16]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[17]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[18]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[19]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[20]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[21]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[22]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[23]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[24]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[25]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[26]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[27]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[28]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[29]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[30]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[31]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[32]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[33]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[34]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[35]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[36]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[37]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[38]} {top/target/tile_prci_domain_1/tile_reset_domain_tile/core/wb_reg_pc[39]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 40 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[0]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[1]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[2]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[3]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[4]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[5]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[6]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[7]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[8]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[9]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[10]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[11]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[12]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[13]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[14]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[15]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[16]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[17]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[18]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[19]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[20]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[21]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[22]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[23]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[24]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[25]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[26]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[27]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[28]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[29]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[30]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[31]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[32]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[33]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[34]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[35]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[36]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[37]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[38]} {top/target/tile_prci_domain_3/tile_reset_domain_tile/core/wb_reg_pc[39]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clock]
