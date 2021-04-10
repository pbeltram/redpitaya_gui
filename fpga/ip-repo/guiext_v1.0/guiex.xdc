
create_clock -add -name dclk -period 25.00 [get_pins { inst/i_dhk/i_cod/CLK }]
set_max_delay -from [get_cells inst/i_dhk/dcod_shift_reg] -to [get_cells inst/i_dhk/i_cod] -datapath_only 25.0
set_max_delay -from [get_cells inst/i_dhk/dcod_read_reg] -to [get_cells inst/i_dhk/i_cod] -datapath_only 25.0
set_max_delay -from [get_cells inst/i_dhk/i_cod] -to [get_cells inst/i_dhk/dcod_value_reg[*]] -datapath_only 25.0

# CDC syncs
set_false_path -through [get_pins -filter {NAME =~ */icdc_sync*/cdc_stage*/PRE} -hier]
set_false_path -through [get_pins -filter {NAME =~ */icdc_sync*/cdc_stage_reg[0]/D} -hier]

