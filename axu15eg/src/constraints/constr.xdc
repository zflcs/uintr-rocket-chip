################## Compress Bitstream ############################
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property IOSTANDARD LVCMOS33 [get_ports {led}]

set_property PACKAGE_PIN AM13 [get_ports {led}]

set_property PACKAGE_PIN D11 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]
set_property PACKAGE_PIN D10 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list system/clk_wiz_0/inst/clk_50M]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {M_MMIO_AXI_araddr[0]} {M_MMIO_AXI_araddr[1]} {M_MMIO_AXI_araddr[2]} {M_MMIO_AXI_araddr[3]} {M_MMIO_AXI_araddr[4]} {M_MMIO_AXI_araddr[5]} {M_MMIO_AXI_araddr[6]} {M_MMIO_AXI_araddr[7]} {M_MMIO_AXI_araddr[8]} {M_MMIO_AXI_araddr[9]} {M_MMIO_AXI_araddr[10]} {M_MMIO_AXI_araddr[11]} {M_MMIO_AXI_araddr[12]} {M_MMIO_AXI_araddr[13]} {M_MMIO_AXI_araddr[14]} {M_MMIO_AXI_araddr[15]} {M_MMIO_AXI_araddr[16]} {M_MMIO_AXI_araddr[17]} {M_MMIO_AXI_araddr[18]} {M_MMIO_AXI_araddr[19]} {M_MMIO_AXI_araddr[20]} {M_MMIO_AXI_araddr[21]} {M_MMIO_AXI_araddr[22]} {M_MMIO_AXI_araddr[23]} {M_MMIO_AXI_araddr[24]} {M_MMIO_AXI_araddr[25]} {M_MMIO_AXI_araddr[26]} {M_MMIO_AXI_araddr[27]} {M_MMIO_AXI_araddr[28]} {M_MMIO_AXI_araddr[29]} {M_MMIO_AXI_araddr[30]} {M_MMIO_AXI_araddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {M_MMIO_AXI_awaddr[0]} {M_MMIO_AXI_awaddr[1]} {M_MMIO_AXI_awaddr[2]} {M_MMIO_AXI_awaddr[3]} {M_MMIO_AXI_awaddr[4]} {M_MMIO_AXI_awaddr[5]} {M_MMIO_AXI_awaddr[6]} {M_MMIO_AXI_awaddr[7]} {M_MMIO_AXI_awaddr[8]} {M_MMIO_AXI_awaddr[9]} {M_MMIO_AXI_awaddr[10]} {M_MMIO_AXI_awaddr[11]} {M_MMIO_AXI_awaddr[12]} {M_MMIO_AXI_awaddr[13]} {M_MMIO_AXI_awaddr[14]} {M_MMIO_AXI_awaddr[15]} {M_MMIO_AXI_awaddr[16]} {M_MMIO_AXI_awaddr[17]} {M_MMIO_AXI_awaddr[18]} {M_MMIO_AXI_awaddr[19]} {M_MMIO_AXI_awaddr[20]} {M_MMIO_AXI_awaddr[21]} {M_MMIO_AXI_awaddr[22]} {M_MMIO_AXI_awaddr[23]} {M_MMIO_AXI_awaddr[24]} {M_MMIO_AXI_awaddr[25]} {M_MMIO_AXI_awaddr[26]} {M_MMIO_AXI_awaddr[27]} {M_MMIO_AXI_awaddr[28]} {M_MMIO_AXI_awaddr[29]} {M_MMIO_AXI_awaddr[30]} {M_MMIO_AXI_awaddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 64 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {M_MMIO_AXI_rdata[0]} {M_MMIO_AXI_rdata[1]} {M_MMIO_AXI_rdata[2]} {M_MMIO_AXI_rdata[3]} {M_MMIO_AXI_rdata[4]} {M_MMIO_AXI_rdata[5]} {M_MMIO_AXI_rdata[6]} {M_MMIO_AXI_rdata[7]} {M_MMIO_AXI_rdata[8]} {M_MMIO_AXI_rdata[9]} {M_MMIO_AXI_rdata[10]} {M_MMIO_AXI_rdata[11]} {M_MMIO_AXI_rdata[12]} {M_MMIO_AXI_rdata[13]} {M_MMIO_AXI_rdata[14]} {M_MMIO_AXI_rdata[15]} {M_MMIO_AXI_rdata[16]} {M_MMIO_AXI_rdata[17]} {M_MMIO_AXI_rdata[18]} {M_MMIO_AXI_rdata[19]} {M_MMIO_AXI_rdata[20]} {M_MMIO_AXI_rdata[21]} {M_MMIO_AXI_rdata[22]} {M_MMIO_AXI_rdata[23]} {M_MMIO_AXI_rdata[24]} {M_MMIO_AXI_rdata[25]} {M_MMIO_AXI_rdata[26]} {M_MMIO_AXI_rdata[27]} {M_MMIO_AXI_rdata[28]} {M_MMIO_AXI_rdata[29]} {M_MMIO_AXI_rdata[30]} {M_MMIO_AXI_rdata[31]} {M_MMIO_AXI_rdata[32]} {M_MMIO_AXI_rdata[33]} {M_MMIO_AXI_rdata[34]} {M_MMIO_AXI_rdata[35]} {M_MMIO_AXI_rdata[36]} {M_MMIO_AXI_rdata[37]} {M_MMIO_AXI_rdata[38]} {M_MMIO_AXI_rdata[39]} {M_MMIO_AXI_rdata[40]} {M_MMIO_AXI_rdata[41]} {M_MMIO_AXI_rdata[42]} {M_MMIO_AXI_rdata[43]} {M_MMIO_AXI_rdata[44]} {M_MMIO_AXI_rdata[45]} {M_MMIO_AXI_rdata[46]} {M_MMIO_AXI_rdata[47]} {M_MMIO_AXI_rdata[48]} {M_MMIO_AXI_rdata[49]} {M_MMIO_AXI_rdata[50]} {M_MMIO_AXI_rdata[51]} {M_MMIO_AXI_rdata[52]} {M_MMIO_AXI_rdata[53]} {M_MMIO_AXI_rdata[54]} {M_MMIO_AXI_rdata[55]} {M_MMIO_AXI_rdata[56]} {M_MMIO_AXI_rdata[57]} {M_MMIO_AXI_rdata[58]} {M_MMIO_AXI_rdata[59]} {M_MMIO_AXI_rdata[60]} {M_MMIO_AXI_rdata[61]} {M_MMIO_AXI_rdata[62]} {M_MMIO_AXI_rdata[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 64 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {M_MMIO_AXI_wdata[0]} {M_MMIO_AXI_wdata[1]} {M_MMIO_AXI_wdata[2]} {M_MMIO_AXI_wdata[3]} {M_MMIO_AXI_wdata[4]} {M_MMIO_AXI_wdata[5]} {M_MMIO_AXI_wdata[6]} {M_MMIO_AXI_wdata[7]} {M_MMIO_AXI_wdata[8]} {M_MMIO_AXI_wdata[9]} {M_MMIO_AXI_wdata[10]} {M_MMIO_AXI_wdata[11]} {M_MMIO_AXI_wdata[12]} {M_MMIO_AXI_wdata[13]} {M_MMIO_AXI_wdata[14]} {M_MMIO_AXI_wdata[15]} {M_MMIO_AXI_wdata[16]} {M_MMIO_AXI_wdata[17]} {M_MMIO_AXI_wdata[18]} {M_MMIO_AXI_wdata[19]} {M_MMIO_AXI_wdata[20]} {M_MMIO_AXI_wdata[21]} {M_MMIO_AXI_wdata[22]} {M_MMIO_AXI_wdata[23]} {M_MMIO_AXI_wdata[24]} {M_MMIO_AXI_wdata[25]} {M_MMIO_AXI_wdata[26]} {M_MMIO_AXI_wdata[27]} {M_MMIO_AXI_wdata[28]} {M_MMIO_AXI_wdata[29]} {M_MMIO_AXI_wdata[30]} {M_MMIO_AXI_wdata[31]} {M_MMIO_AXI_wdata[32]} {M_MMIO_AXI_wdata[33]} {M_MMIO_AXI_wdata[34]} {M_MMIO_AXI_wdata[35]} {M_MMIO_AXI_wdata[36]} {M_MMIO_AXI_wdata[37]} {M_MMIO_AXI_wdata[38]} {M_MMIO_AXI_wdata[39]} {M_MMIO_AXI_wdata[40]} {M_MMIO_AXI_wdata[41]} {M_MMIO_AXI_wdata[42]} {M_MMIO_AXI_wdata[43]} {M_MMIO_AXI_wdata[44]} {M_MMIO_AXI_wdata[45]} {M_MMIO_AXI_wdata[46]} {M_MMIO_AXI_wdata[47]} {M_MMIO_AXI_wdata[48]} {M_MMIO_AXI_wdata[49]} {M_MMIO_AXI_wdata[50]} {M_MMIO_AXI_wdata[51]} {M_MMIO_AXI_wdata[52]} {M_MMIO_AXI_wdata[53]} {M_MMIO_AXI_wdata[54]} {M_MMIO_AXI_wdata[55]} {M_MMIO_AXI_wdata[56]} {M_MMIO_AXI_wdata[57]} {M_MMIO_AXI_wdata[58]} {M_MMIO_AXI_wdata[59]} {M_MMIO_AXI_wdata[60]} {M_MMIO_AXI_wdata[61]} {M_MMIO_AXI_wdata[62]} {M_MMIO_AXI_wdata[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list M_MMIO_AXI_arready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list M_MMIO_AXI_arvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list M_MMIO_AXI_awready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list M_MMIO_AXI_awvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list M_MMIO_AXI_rready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list M_MMIO_AXI_rvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list M_MMIO_AXI_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list M_MMIO_AXI_wvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clock]
