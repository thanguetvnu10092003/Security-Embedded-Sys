# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/vivado/xillydemo.runs/synth_1/xillydemo.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_msg_config  -id {BD 41-968}  -string {{xillybus_S_AXI}}  -new_severity {INFO} 
set_msg_config  -id {BD 41-967}  -string {{xillybus_ip_0/xillybus_M_AXI}}  -new_severity {INFO} 
set_msg_config  -id {BD 41-967}  -string {{xillybus_ip_0/xillybus_S_AXI}}  -new_severity {INFO} 
set_msg_config  -id {BD 41-678}  -string {{xillybus_S_AXI/Reg}}  -new_severity {INFO} 
set_msg_config  -id {BD 41-1356}  -string {{xillybus_S_AXI/Reg}}  -new_severity {INFO} 
set_msg_config  -id {BD 41-759}  -string {{xlconcat_0/In}}  -new_severity {INFO} 
set_msg_config  -id {Netlist 29-160}  -string {{vivado_system_processing_system7}}  -new_severity {INFO} 
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/vivado/xillydemo.cache/wt [current_project]
set_property parent.project_path D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/vivado/xillydemo.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado-ip [current_project]
update_ip_catalog
set_property ip_output_repo d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/vivado/xillydemo.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog -library xil_defaultlib {
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/xillydemo.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/xillybus_core.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/xillybus.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/system.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/smbus.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/i2s_audio.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_zero_digits_data_V_RAM_AUTO_1R1W.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_udiv_128ns_64ns_64_132_seq_1.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_q_digits_data_V_RAM_AUTO_0R0W.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_operator_Pipeline_OUTER_INNER.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_operator_mul.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_operator_lt.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_operator_1_Pipeline_OUTER_INNER.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_operator_1.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_mul_64ns_65ns_192_3_1.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_mul_64ns_64ns_128_3_1.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_modulus_digits_data_V_RAM_AUTO_1R1W.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_flow_control_loop_pipe_sequential_init.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_dut_Pipeline_WRITE_LOOP.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_dut_Pipeline_VITIS_LOOP_14_1.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_dut_Pipeline_SHIFT.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_dut_Pipeline_READ_LOOP4.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_dut_Pipeline_READ_LOOP3.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_dut_Pipeline_READ_LOOP.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_w_digits_data_V_RAM_AUTO_1R1W.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_SHIFT6.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_SHIFT5.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_SHIFT.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_REM.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_PARTIAL.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_NORMALIZE.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_COMPARE.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_CLEAR_UPPER.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide_Pipeline_ADJUST.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut_divide.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fpga-design/dut.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fifo_8x2048.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/xillybus/src/fifo_32x512.v
  D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/system.v
}
read_ip -quiet D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vga_fifo/vga_fifo.xci
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vga_fifo/vga_fifo.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vga_fifo/vga_fifo_clocks.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vga_fifo/vga_fifo_ooc.xdc]

read_ip -quiet D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/fifo_8x2048/fifo_8x2048.xci
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/fifo_8x2048/fifo_8x2048.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/fifo_8x2048/fifo_8x2048_ooc.xdc]

read_ip -quiet D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/fifo_32x512/fifo_32x512.xci
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/fifo_32x512/fifo_32x512.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/fifo_32x512/fifo_32x512_ooc.xdc]

add_files D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/vivado_system.bd
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/ip/vivado_system_processing_system7_0_0/vivado_system_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/ip/vivado_system_rst_processing_system7_0_100M_0/vivado_system_rst_processing_system7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/ip/vivado_system_rst_processing_system7_0_100M_0/vivado_system_rst_processing_system7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/ip/vivado_system_rst_processing_system7_0_100M_0/vivado_system_rst_processing_system7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/ip/vivado_system_auto_pc_3/vivado_system_auto_pc_3_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/ip/vivado_system_auto_pc_0/vivado_system_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/ip/vivado_system_auto_pc_1/vivado_system_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/ip/vivado_system_auto_pc_2/vivado_system_auto_pc_2_ooc.xdc]
set_property used_in_implementation false [get_files -all D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/vivado_system/vivado_system_ooc.xdc]

set_property edif_extra_search_paths D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/cores [current_fileset]
OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/xillydemo.xdc
set_property used_in_implementation false [get_files D:/Study/Tai_lieu/Nhung_bao_mat/Final/Code/Test2/zedboard_project/vivado-essentials/xillydemo.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top xillydemo -part xc7z020clg484-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef xillydemo.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file xillydemo_utilization_synth.rpt -pb xillydemo_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }