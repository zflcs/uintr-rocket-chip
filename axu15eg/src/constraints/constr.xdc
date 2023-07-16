################## Compress Bitstream ############################
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property IOSTANDARD LVCMOS33 [get_ports {led}]

set_property PACKAGE_PIN AM13 [get_ports {led}]

set_property PACKAGE_PIN D11 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]
set_property PACKAGE_PIN D10 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]


