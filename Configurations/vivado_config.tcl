# StateMover Path
set StateMoverPath [file dirname [exec which StateMover]]/..

# Sim Path
set SIMBIN_PATH [file dirname [exec which vsim]]
# !!! change to your own path !!!
set SIMLIB_PATH "~/compile_simlib/modelsim"

# Project Info
set projName counter
set prModule ""
set taskName inst_count

# Set USE_BOARDFILES to Set Board Part
# You May Need to Install Board Files First
set USE_BOARDFILES 1
# Select Only One Active Configuration
set BOARD "SIDEWINDER"
# set BOARD "AU200"
# set BOARD "VCU118"

if {$BOARD == "SIDEWINDER"} {
    set DEVICE_NAME xczu19eg-ffvc1760-2-i
    set BOARD_NAME fidus.com:sidewinder100:part0:2.0
} elseif {$BOARD == "AU200"} {
    set DEVICE_NAME xcu200-fsgd2104-2-e
    set BOARD_NAME xilinx.com:au200:part0:1.3
} elseif {$BOARD == "VCU118"} {
    set DEVICE_NAME xcvu9p-flga2104-2l-e
    set BOARD_NAME xilinx.com:vcu118:part0:2.4
} else {
    puts "Unsupported Board: $BOARD"
}

# Project Files


