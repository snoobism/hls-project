# ------------------------------------------------------------------------------
# Vitis HLS Project User Settings
# ------------------------------------------------------------------------------
set SOLUTION_PART "xc7a15tcpg236-1"
set SOLUTION_CLKP 1000.0
# MAJOR.MINOR.REVISION
set VERSION "1.0.0"
set DISPLAY_NAME "HLS Project"
set DESCRIPTION "A basic HLS project"
set VENDOR "DemoVendor"

# ------------------------------------------------------------------------------
# Vitis HLS Project Information
# ------------------------------------------------------------------------------
set PROJ_DIR "."
set SOURCE_DIR "./src"
set PROJ_NAME "ws"
set PROJ_TOP "main"
set SOLUTION_NAME "sol1"

# ------------------------------------------------------------------------------
# Create Project
# ------------------------------------------------------------------------------
open_project -reset $PROJ_NAME

# ------------------------------------------------------------------------------
# Add C++ source and Testbench files
# ------------------------------------------------------------------------------
foreach file [glob -nocomplain -directory ${SOURCE_DIR} *.cpp] {
    puts $file
    if {[string match {*_tb.cpp} $file]} {
        add_files -tb $file
    } else {
        add_files $file
    }
}

# ------------------------------------------------------------------------------
# Create Project and Solution
# ------------------------------------------------------------------------------
set_top $PROJ_TOP
open_solution -reset $SOLUTION_NAME
set_part $SOLUTION_PART
create_clock -period $SOLUTION_CLKP

# -----------------------------------------------------------------------------
# Open project in GUI
# -----------------------------------------------------------------------------
vitis_hls -p $PROJ_NAME