
# Expansion connector
set_property -dict {PACKAGE_PIN G17 IOSTANDARD TMDS_33} [get_ports {exp_p_o[0]}] ;#E1-3
set_property -dict {PACKAGE_PIN G18 IOSTANDARD TMDS_33} [get_ports {exp_n_o[0]}] ;#E1-4
set_property -dict {PACKAGE_PIN H16 IOSTANDARD TMDS_33} [get_ports {exp_p_o[1]}] ;#E1-5
set_property -dict {PACKAGE_PIN H17 IOSTANDARD TMDS_33} [get_ports {exp_n_o[1]}] ;#E1-6
set_property -dict {PACKAGE_PIN J18 IOSTANDARD TMDS_33} [get_ports {exp_p_o[2]}] ;#E1-7
set_property -dict {PACKAGE_PIN H18 IOSTANDARD TMDS_33} [get_ports {exp_n_o[2]}] ;#E1-8
set_property -dict {PACKAGE_PIN K17 IOSTANDARD TMDS_33} [get_ports {exp_p_o[3]}] ;#E1-9
set_property -dict {PACKAGE_PIN K18 IOSTANDARD TMDS_33} [get_ports {exp_n_o[3]}] ;#E1-10

#SPI0
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 8}             [get_ports {spi0_io0_io}] ;#E1-13
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 8}             [get_ports {spi0_io1_io}] ;#E1-14
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 8}             [get_ports {spi0_sck_io}] ;#E1-15
set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 8 PULLUP TRUE} [get_ports {spi0_ss_io}]  ;#E1-16
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 8}             [get_ports {spi0_ss1_o}]  ;#E1-17
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 8}             [get_ports {spi0_ss2_o}]  ;#E1-18

# LED
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 8} [get_ports {led_o[0]}]
set_property -dict {PACKAGE_PIN F17 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 8} [get_ports {led_o[1]}]
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 8} [get_ports {led_o[2]}]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 8} [get_ports {led_o[3]}]
set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 8} [get_ports {led_o[4]}]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 8} [get_ports {led_o[5]}]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 8} [get_ports {led_o[6]}]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 8} [get_ports {led_o[7]}]

