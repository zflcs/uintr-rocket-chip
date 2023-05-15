# Usage: xsct [this tcl file] [dts_repo] [xsa_file|hdf_file] [brd_name] [dir_name]


if {[llength $argv] < 4} {
    puts "Wrong arguments!"
    return 1
} else {
    set dts_repo [lindex $argv 0]
    set hw_file [lindex $argv 1]
    set brd_name [lindex $argv 2]
    set dir_name [lindex $argv 3]
}

set hw_design [hsi open_hw_design ${hw_file}]

hsi set_repo_path ${dts_repo}

switch -regexp -- $brd_name {
  zcu102 {
    set processor psu_cortexa53_0
    set brd_version zcu102-rev1.0
    set arch zynqmp
  }
  default {
    puts "Unsupported board $brd_name"
    return 1
  }
}

# Create SW design and setup CPU
set procs [hsi get_cells -hier -filter {IP_TYPE==PROCESSOR}]
puts "List of processors found in XSA is $procs"
hsi create_sw_design device-tree -os device_tree -proc ${processor}

# Generate DTS/DTSI files to target directory
hsi generate_target -help
hsi generate_target -dir ${dir_name}

# Clean up
hsi close_hw_design [hsi current_hw_design]
exit