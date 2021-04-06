# Clock constraints

set pxlclk   [get_clocks clk_out1_system_clkgen_0]
set pxl5clk  [get_clocks PixelClkInX5]
set cfgclk   [get_clocks clk_fpga_0]
set hpmclk   [get_clocks clk_fpga_3]

set_false_path -from $hpmclk -to $cfgclk
set_false_path -from $cfgclk -to $hpmclk

set_false_path -from $pxlclk  -to $cfgclk
set_false_path -from $cfgclk  -to $pxlclk

set_false_path -from $pxl5clk -to $pxlclk
#set_false_path -from $pxlclk -to $pxl5clk

set_false_path -from $hpmclk  -to $pxlclk
set_false_path -from $pxlclk  -to $hpmclk

#Set output delay to keep tools warning ok.
set_output_delay 0.0 -clock $cfgclk [get_ports {led_o[*]}]
set_output_delay 0.0 -clock $pxlclk [get_ports {exp_p_o[*]}]
