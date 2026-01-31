## Clock signal
set_property PACKAGE_PIN W5 [get_ports clock100]							
set_property IOSTANDARD LVCMOS33 [get_ports clock100]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock100]



##7 segment display
set_property PACKAGE_PIN W7 [get_ports {numbers[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {numbers[6]}]

set_property PACKAGE_PIN W6 [get_ports {numbers[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {numbers[5]}]

set_property PACKAGE_PIN U8 [get_ports {numbers[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {numbers[4]}]

set_property PACKAGE_PIN V8 [get_ports {numbers[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {numbers[3]}]

set_property PACKAGE_PIN U5 [get_ports {numbers[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {numbers[2]}]

set_property PACKAGE_PIN V5 [get_ports {numbers[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {numbers[1]}]

set_property PACKAGE_PIN U7 [get_ports {numbers[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {numbers[0]}]


set_property PACKAGE_PIN U2 [get_ports {segmentation[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segmentation[0]}]

set_property PACKAGE_PIN U4 [get_ports {segmentation[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segmentation[1]}]

set_property PACKAGE_PIN V4 [get_ports {segmentation[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segmentation[2]}]

set_property PACKAGE_PIN W4 [get_ports {segmentation[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segmentation[3]}]



## Switches
set_property PACKAGE_PIN V17 [get_ports resetpin]					
set_property IOSTANDARD LVCMOS33 [get_ports resetpin]


