# Load Project Configuration
source vivado_config.tcl

# define the output directory area.
set outputDir ./$projName
file mkdir $outputDir

# create project
create_project -part $DEVICE_NAME -f $projName $outputDir
if {$USE_BOARDFILES == 1} {
	set_property board_part $BOARD_NAME [current_project]
}

# Set project properties
set obj [current_project]

# setup design sources and constraints
add_files [ glob ./src/top.v ./src/count.v]
add_files [ glob ./src/interruption_logic.v ]
import_files [ glob ./src/il_vio.xci ]
add_files -fileset constrs_1 [ glob ./src/sidewinder.xdc ]
add_files -fileset sim_1 -norecurse [ glob ./src/sys_tb.v ]

set_property top top [current_fileset]

# create a PR project if prModule is set
# if { $prModule ne "" } {
# 	set_property PR_FLOW 1 [current_project]
# 	create_partition_def -name bist -module $prModule
#	create_reconfig_module -name $prModule -partition_def [get_partition_defs bist] -define_from $prModule
#	create_pr_configuration -name config_1 -partitions [list $taskName:$prModule]
#	set_property PR_CONFIGURATION config_1 [get_runs impl_1]
# }

exit

