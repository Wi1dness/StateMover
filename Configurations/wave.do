radix hex
add wave -divider "TB Signals"
add wave /sys_tb/load
add wave /sys_tb/dump

add wave -divider "IL Signals"
add wave /sys_tb/uut/il/breakpoint
add wave /sys_tb/uut/il/counter

add wave -divider "Task Signals"
add wave /sys_tb/uut/count_inst/clk
add wave /sys_tb/uut/count_inst/rst
add wave /sys_tb/uut/count_inst/count_out
