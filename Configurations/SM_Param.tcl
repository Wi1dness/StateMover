# Select Only One Active Configuration
set BOARD "SIDEWINDER"
# set BOARD "AU200"
# set BOARD "VCU118"

if {$BOARD == "SIDEWINDER"} {
    set DEVICE_NAME xczu19eg-ffvc1760-2-i
    set BOARD_NAME fidus.com:sidewinder100:part0:2.0
    set ARCH "UltraScalePlus"
} elseif {$BOARD == "AU200"} {
    set DEVICE_NAME xcu200-fsgd2104-2-e
    set BOARD_NAME xilinx.com:au200:part0:1.3
    set ARCH "UltraScalePlus"
} elseif {$BOARD == "VCU118"} {
    set DEVICE_NAME xcvu9p-flga2104-2l-e
    set BOARD_NAME xilinx.com:vcu118:part0:2.4
    set ARCH "UltraScalePlus"
} else {
    set ARCH "Unknown"
    puts "Unsupported Board: $BOARD"
}

set TASK_NAME ""
set DESIGN_PATH "./counter"

set FULL_BITSTREAM "$DESIGN_PATH/top.bit"
set FULL_PROBES "$DESIGN_PATH/top.ltx"

set FULL_LOCAL_BITSTREAM "$DESIGN_PATH/top_modified.bit"

set PARTIAL_BITSTREAM [glob -nocomplain "$DESIGN_PATH/*_partial.bit"]
set PARTIAL_PROBES [glob -nocomplain "$DESIGN_PATH/*_partial.ltx"]

set PARTIAL_CLEAR_BITSTREAM [glob -nocomplain "$DESIGN_PATH/*_partial_clear.bit"]
set PARTIAL_CLEAR_PROBES [glob -nocomplain "$DESIGN_PATH/*_partial_clear.ltx"]

set LOGIC_LOCATION_FILE "$DESIGN_PATH/top.ll"
set RAM_LOCATION_FILE "$DESIGN_PATH/top.rl"

set READBACK_FILE "top.rdbk"

set CE_VIO_INSTANCE "il/il_vio_inst"
set CE_VIO_SIGNAL "il/clk_en"

set TI_VIO_INSTANCE "il/il_vio_inst"
set TI_VIO_SIGNAL "il/ti_req"

set PR_VIO_INSTANCE "il/il_vio_inst"
set PR_VIO_SIGNAL "il/pr_done"

set BP_VIO_INSTANCE "il/il_vio_inst"
set BP_VIO_SIGNAL "il/breakpoint"

set CS_VIO_INSTANCE "il/il_vio_inst"
set CS_VIO_SIGNAL "il/clk_step"

set CS2_VIO_INSTANCE "il/il_vio_inst"
set CS2_VIO_SIGNAL "il/clk_step_1"

set USER_VIO_INSTANCE "inst_vio_1"
set USER_VIO_SIGNAL "valid_counter"

# A DRAM page is 2KB. PAGE_COUNT should be divisble by 16
set DRAM_START_ADDRESS 0
set DRAM_PAGE_COUNT 1024

set READBACK_START_ADDRESS 00000000
if {$BOARD == "SIDEWINDER"} {
    set READBACK_FRAME_COUNT_FULL 97691
} else {
    set READBACK_FRAME_COUNT_FULL 215460
}
set READBACK_FULL_START_ADDRESS 00000000
set READBACK_BRAM_START_ADDRESS 00000000
set READBACK_BRAM_FRAME_COUNT 0
