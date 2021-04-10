# This XDC is used only for OOC mode of synthesis, implementation
# User should update the correct clock period before proceeding further

create_clock -name axi_clock -period 10.000 [get_ports s_axilite_aclk]
create_clock -name axis_clock -period 6.562 [get_ports s_axis_clk]
create_clock -name pxl_clock -period 9.259 [get_ports pxl_clk]
