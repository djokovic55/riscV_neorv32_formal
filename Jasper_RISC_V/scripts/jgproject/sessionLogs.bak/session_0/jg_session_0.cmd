# ----------------------------------------
# Jasper Version Info
# tool      : Jasper 2023.12
# platform  : Linux 3.10.0-1160.88.1.el7.x86_64
# version   : 2023.12p001 64 bits
# build date: 2024.01.23 16:09:24 UTC
# ----------------------------------------
# started   : 2024-08-21 12:22:25 IDT
# hostname  : veri-xn123.qb.veriest.qb.veriest
# pid       : 30525
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:34102' '-style' 'windows' '-data' 'AAAAxHicY2RgYLCp////PwMYMFcBCQEGHwZfhiAGVyDpzxAGpBkYFBhMGYwYLBgMGBwYyhhSGYoYMhl0GYqB7GSgmCmDCUQ/4wMIzWDDyIAKQHwmVJHABhSagYEVphlZkwzQrlKGPIZ4oE0FQFY8QxZDOoMeQwmQnwNWBQDUzxRl' '-proj' '/home/aleksadj/Desktop/RISC_V_PROJECT/Jasper_RISC_V/scripts/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/aleksadj/Desktop/RISC_V_PROJECT/Jasper_RISC_V/scripts/jgproject/.tmp/.initCmds.tcl' 'run_cpu_jg.tcl'

clear -all

set proj_dir "/home/aleksadj/Desktop/RISC_V_PROJECT"
## -------------- To Analyze VHDL Files ---------------- ##
# analyze -vhdl -lib neorv32 {/home/tivadarm/RISC_V_NEORV32/neorv32-main/rtl/core/neorv32_package.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_clockgate.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_fifo.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_decompressor.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_control.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_regfile.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_shifter.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_muldiv.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_bitmanip.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_fpu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_cfu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_cond.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_alu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_lsu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_pmp.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_intercon.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cache.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_dma.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_imem.entity.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_dmem.entity.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_boot_rom.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_xip.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_xbus.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cfs.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_sdi.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_gpio.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_wdt.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_mtime.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_uart.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_spi.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_twi.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_pwm.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_trng.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_neoled.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_xirq.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_gptmr.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_onewire.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_slink.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_crc.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_sysinfo.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_debug_dtm.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_debug_dm.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_top.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_bootloader_image.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_application_image.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/mem/neorv32_imem.legacy.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/mem/neorv32_dmem.legacy.vhd}

## ----------------- ANALYZE COMMANDS ------------------ ##
## -------------- To Analyze VHDL Files ---------------- ##

analyze -vhdl -lib neorv32 -f $proj_dir/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_cpu.f
analyze -vhdl -f $proj_dir/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_cpu.f

## --------------- To Analyze SV Files ----------------- ##

analyze -sv $proj_dir/Jasper_RISC_V/env/checks/checker_cpu.sv
analyze -sv $proj_dir/Jasper_RISC_V/env/cpu_bind.sv


## --------------- ELABORATION COMMANDS ---------------- ##
# Elaborate command with black-box modules and instances
# FAST_MUL_EN -> Disable FAST MULTI as it will be blackboxed anyway
# Pay attention to IMEM, DMEM, ICACHE and DCAHCE SIZE

# -param CPU_BOOT_ADDR 0
elaborate -vhdl -top {neorv32_cpu} \
-param HART_ID 0 \
-param VENDOR_ID 0 \
-param CPU_DEBUG_PARK_ADDR 0 \
-param CPU_DEBUG_EXC_ADDR 0 \
-param CPU_EXTENSION_RISCV_A 0 \
-param CPU_EXTENSION_RISCV_B 0 \
-param CPU_EXTENSION_RISCV_C 0 \
-param CPU_EXTENSION_RISCV_E 0 \
-param CPU_EXTENSION_RISCV_M 0 \
-param CPU_EXTENSION_RISCV_U 0 \
-param CPU_EXTENSION_RISCV_ZFINX 0 \
-param CPU_EXTENSION_RISCV_ZICNTR 1 \
-param CPU_EXTENSION_RISCV_ZICOND 0 \
-param CPU_EXTENSION_RISCV_ZIHPM 0 \
-param CPU_EXTENSION_RISCV_ZMMUL 0 \
-param CPU_EXTENSION_RISCV_ZXCFU 0 \
-param CPU_EXTENSION_RISCV_Sdext 0 \
-param CPU_EXTENSION_RISCV_Sdtrig 0 \
-param CPU_EXTENSION_RISCV_Smpmp 0 \
-param FAST_MUL_EN 0 \
-param FAST_SHIFT_EN 0 \
-param REGFILE_HW_RST 0 \
-param PMP_NUM_REGIONS 0 \
-param PMP_MIN_GRANULARITY 4 \
-param PMP_TOR_MODE_EN 1 \
-param PMP_NAP_MODE_EN 1 \
-param HPM_NUM_CNTS 0 \
-param HPM_CNT_WIDTH 40 

# --------------- CLK + RST ---------------- ##


clock {clk_i}
clock -list configuration
reset {rstn_i}

## ------------------- Get design info ----------------- ##

# To list design summary
get_design_info


## -------- Sanity check of Clock, Reset, Assumptions ------- ##
# To verify clock/reset setup
sanity_check
# To debug/analyze reset phase
visualize -reset
# To check for assumption conflicts
check_assumptions



include run_cpu_jg.tcl
visualize -new_window -raise
visualize -new_window -raise
include run_cpu_jg.tcl
visualize -new_window -raise
visualize -new_window; visualize -cover {(neorv32_cpu_alu_inst.ctrl_i.alu_op = "001")} -bg
visualize -new_window; visualize -cover {(neorv32_cpu_control_inst.fetch_engine.state /= "00")} -bg
include run_cpu_jg.tcl
visualize -new_window; visualize -cover {(neorv32_cpu_control_inst.fetch_engine.state /= "00")} -bg
visualize -new_window; visualize -cover {(neorv32_cpu_alu_inst.ctrl_i.alu_op = "001")} -bg
include run_cpu_jg.tcl
visualize -new_window; visualize -cover {(neorv32_cpu_alu_inst.ctrl_i.alu_op = "001")} -bg
visualize -quiet true -window visualize:0
visualize -replot -bg -window visualize:0 -prompt
visualize -at_least_once {(neorv32_cpu_control_inst.execute_engine.ir = X"00a00513")} {1:$} -name viz_conf:0 -window visualize:0
visualize -replot -bg -window visualize:0 -prompt
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -freeze 0 -window visualize:0
visualize -new_window -copy -window {visualize:0}
visualize -replot -bg -window visualize:0_copy -prompt
visualize -freeze 0 -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -at_least_once {(neorv32_cpu_regfile_inst.reg_file(10) = X"0000000a")} {2:$} -name viz_conf:1 -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -replace_conf -name viz_conf:1 -at_least_once {(neorv32_cpu_regfile_inst.reg_file(10) = X"0000000a")} {7:$} -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -force -name wave_edit:0 { not neorv32_cpu_regfile_inst.reg_file(10)} 1:6 -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -replace_conf -name wave_edit:0 -force {neorv32_cpu_regfile_inst.reg_file(10) = 0} 1:6 -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -at_least_once {(neorv32_cpu_control_inst.fetch_engine.pc = X"00000010")} {11:$} -name viz_conf:2 -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -disable_conf viz_conf:0 -window visualize:0_copy; visualize -disable_conf viz_conf:1 -window visualize:0_copy; visualize -disable_conf wave_edit:0 -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -disable_conf viz_conf:2 -window visualize:0_copy
visualize -enable_conf wave_edit:0 -window visualize:0_copy; visualize -enable_conf viz_conf:1 -window visualize:0_copy; visualize -enable_conf viz_conf:0 -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -at_least_once {(neorv32_cpu_control_inst.execute_engine.state = 8)} {10:$} -name viz_conf:3 -window visualize:0_copy
visualize -replot -bg -window visualize:0_copy -prompt
visualize -min_length [expr [visualize -get_length -window visualize:0_copy] + 1] -window visualize:0_copy; visualize -freeze [visualize -get_length -window visualize:0_copy] -window visualize:0_copy; visualize -replot -bg -window visualize:0_copy
cover -name <constraints>::cov_branch {neorv32_cpu_control_inst.execute_engine.pc = x"4" |=> neorv32_cpu_control_inst.execute_engine.pc = x"14"};
prove -bg -property {<constraints>::cov_branch}
visualize -property <constraints>::cov_branch -new_window
include run_cpu_jg.tcl
visualize neorv32_cpu_control_inst.pc_we -new_window
visualize -new_window; visualize -cover {(neorv32_cpu_control_inst.execute_engine.pc_we /= "0")} -bg
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
cover -name <constraints>::cov_pc_we {neorv32_cpu_control_inst.execute_engine.pc_we = 1};
prove -bg -property {<constraints>::cov_pc_we}
include run_cpu_jg.tcl
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc}
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_same_pc}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_same_pc -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc <embedded>::neorv32_cpu.chk_cpu.ast_pc:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc <embedded>::neorv32_cpu.chk_cpu.ast_pc:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc <embedded>::neorv32_cpu.chk_cpu.ast_pc:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc <embedded>::neorv32_cpu.chk_cpu.ast_pc:precondition1}
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_same_pc}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_same_pc -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
schematic_viewer -draw -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_pc_we}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_pc_we -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_same_pc_if_not_initial}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_same_pc_if_not_initial -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_same_pc_if_not_initial}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_same_pc_if_not_initial -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_same_pc_if_not_initial}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_same_pc_if_not_initial -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc}
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_same_pc_if_not_initial}
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_no_same_pc_if_initial <embedded>::neorv32_cpu.chk_cpu.ast_no_same_pc_if_initial:precondition1}
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_jump_target -new_window
include run_cpu_jg.tcl
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_jump_target -new_window
include run_cpu_jg.tcl
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_same_pc_after_inital_case_target -new_window
include run_cpu_jg.tcl
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_same_pc_after_inital_case_target -new_window
visualize -comment -arrow {neorv32_cpu_control_inst.execute_engine.next_pc 13 red 3418} {neorv32_cpu_control_inst.execute_engine.next_pc 11 red 3418} -text {} Annotation_1 -append -window visualize:0; visualize -activate_color_annotation Annotation_1 -window visualize:0
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_same_pc_after_inital_case_target -new_window
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc3_target -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc2_target -new_window
include run_cpu_jg.tcl
visualize -property <embedded>::neorv32_cpu.chk_cpu.ast_pc2_target:precondition1 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
help prove
help helper_gen
help helper_define
prove
help helper_set_assert
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu._assert_2 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 16] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -at_least_once {(neorv32_cpu_regfile_inst.reg_file(12) = X"7")} {9:$} -name viz_conf:0 -window visualize:0
visualize -replot -bg -window visualize:0
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_addi_inst}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_addi_inst -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_addi_inst}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_addi_inst -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_addi_inst}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_addi_inst -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 6] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_addi_inst}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_addi_inst -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_addi_inst}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_addi_inst -new_window
include run_cpu_jg.tcl
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_addi_inst <embedded>::neorv32_cpu.chk_cpu.ast_addi_inst:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_addi_inst -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_addi_inst <embedded>::neorv32_cpu.chk_cpu.ast_addi_inst:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_addi_inst -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 16] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -at_least_once {(neorv32_cpu_control_inst.execute_engine.pc = X"00000008")} {15:$} -name viz_conf:0 -window visualize:0
visualize -replot -bg -window visualize:0
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1}
clear -result
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1}
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_addi_inst <embedded>::neorv32_cpu.chk_cpu.ast_addi_inst:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_addi_inst -new_window
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_addi_inst2}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_addi_inst2 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 10] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -freeze 0 -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 10] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -freeze 0 -window visualize:0
include run_cpu_jg.tcl
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_addi_inst2}
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1}
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_beq_check_sanity}
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_beq_check_sanity}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_beq_check_sanity -new_window
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1 <embedded>::neorv32_cpu.chk_cpu.ast_pc_main}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_aux_chosen_flag <embedded>::neorv32_cpu.chk_cpu.ast_aux_chosen_flag:precondition1 <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1 <embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.cov_beq_check_sanity}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_aux_chosen_flag -new_window
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_aux_chosen_flag <embedded>::neorv32_cpu.chk_cpu.ast_aux_chosen_flag:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_aux_chosen_flag -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 5] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_aux_chosen_flag:precondition1 <embedded>::neorv32_cpu.chk_cpu.ast_aux_chosen_flag}
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1}
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main -new_window
visualize -comment -arrow {neorv32_cpu_control_inst.execute_engine.branch_taken 9 red 5548} {chk_cpu.dut_pc_gbox 10 red 5540} -text {} Annotation_2 -append -window visualize:0; visualize -activate_color_annotation Annotation_2 -window visualize:0
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main <embedded>::neorv32_cpu.chk_cpu.ast_pc_main:precondition1}
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -comment -arrow {chk_cpu.opcode_gbox 7 red 5621} {chk_cpu.chosen_reg_data_next 7 red 5670} -text {chosen_reg must keep previous value,
update only during ADDI} Annotation_3 -append -window visualize:0; visualize -activate_color_annotation Annotation_3 -window visualize:0
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -comment {chk_cpu.chosen_reg_data 36 red 5697} -text {Zero reg cannot be updated
} Annotation_5 -append -window visualize:0; visualize -activate_color_annotation Annotation_5 -window visualize:0
visualize -comment {chk_cpu.chosen_reg_data 36 red 5697} -text {Zero reg cannot be updated
} Annotation_5 -remove -window visualize:0
visualize -comment -arrow {chk_cpu.chosen_reg_ndc 32 red 5704} {chk_cpu.chosen_reg_data 36 red 5697} -text {Zero reg cannot be updated} Annotation_5 -append -window visualize:0; visualize -activate_color_annotation Annotation_5 -window visualize:0
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -comment -arrow {chk_cpu.dut_regs_gbox(10) 5 red 5890} {chk_cpu.imm12 5 red 5891} -text {} Annotation_6 -append -window visualize:0; visualize -activate_color_annotation Annotation_6 -window visualize:0
visualize -comment -arrow {chk_cpu.imm12 5 red 5891} {chk_cpu.chosen_reg_data_next 5 red 5843} -text {} Annotation_6 -append -window visualize:0; visualize -activate_color_annotation Annotation_6 -window visualize:0
visualize -comment -arrow {neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en 6 red 5883} {chk_cpu.dut_regs_gbox(10) 7 red 5890} -text {} Annotation_6 -append -window visualize:0; visualize -activate_color_annotation Annotation_6 -window visualize:0
visualize -comment -arrow {chk_cpu.dut_regs_gbox(10) 5 red 5890} {chk_cpu.imm12 5 red 5891} -text {} Annotation_6 -remove -window visualize:0
visualize -comment -arrow {chk_cpu.imm12 5 red 5891} {chk_cpu.chosen_reg_data_next 5 red 5843} -text {} Annotation_6 -remove -window visualize:0
visualize -comment -arrow {chk_cpu.dut_regs_gbox(10) 5 green 5890} {chk_cpu.imm12 5 green 5891} -text {} Annotation_6 -append -window visualize:0; visualize -activate_color_annotation Annotation_6 -window visualize:0
visualize -comment -arrow {chk_cpu.imm12 5 green 5891} {chk_cpu.chosen_reg_data_next 5 green 5843} -text {} Annotation_6 -append -window visualize:0; visualize -activate_color_annotation Annotation_6 -window visualize:0
visualize -comment -arrow {neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en 6 red 5883} {chk_cpu.dut_regs_gbox(10) 7 red 5890} -text {} Annotation_6 -remove -window visualize:0
visualize -comment -arrow {neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en 6 blue 5883} {chk_cpu.dut_regs_gbox(10) 7 blue 5890} -text {} Annotation_6 -append -window visualize:0; visualize -activate_color_annotation Annotation_6 -window visualize:0
visualize -comment -arrow {chk_cpu.dut_regs_gbox(10) 7 red 5890} {chk_cpu.imm12 7 red 5891} -text {} Annotation_6 -append -window visualize:0; visualize -activate_color_annotation Annotation_6 -window visualize:0
visualize -comment -arrow {chk_cpu.imm12 7 red 5891} {chk_cpu.chosen_reg_data_next 7 red 5843} -text {} Annotation_6 -append -window visualize:0; visualize -activate_color_annotation Annotation_6 -window visualize:0
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -define_color_annotation {{chk_cpu.imm12 5 red} {chk_cpu.chosen_reg_data 7 red} {chk_cpu.dut_regs_gbox(2) 7 red}} Annotation_7 -append -window visualize:0; visualize -activate_color_annotation Annotation_7 -window visualize:0
visualize -comment -arrow {chk_cpu.imm12 5 red 5920} {chk_cpu.chosen_reg_data 7 red 5918} -text {} Annotation_7 -append -window visualize:0; visualize -activate_color_annotation Annotation_7 -window visualize:0
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -comment -arrow {chk_cpu.chosen_reg_flag 8 red 5999} {neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en 8 red 5996} -text {} Annotation_8 -append -window visualize:0; visualize -activate_color_annotation Annotation_8 -window visualize:0
visualize -comment -arrow {neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en 8 red 5996} {chk_cpu.rd 8 red 6034} -text {} Annotation_8 -append -window visualize:0; visualize -activate_color_annotation Annotation_8 -window visualize:0
visualize -comment -arrow {neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en 8 red 5996} {chk_cpu.dut_regs_gbox(3) 9 red 6005} -text {} Annotation_8 -append -window visualize:0; visualize -activate_color_annotation Annotation_8 -window visualize:0
visualize -comment -arrow {chk_cpu.chosen_reg_data 9 red 5990} {chk_cpu.dut_regs_gbox(3) 9 red 6005} -text {} Annotation_8 -append -window visualize:0; visualize -activate_color_annotation Annotation_8 -window visualize:0
visualize -comment -arrow {chk_cpu.chosen_reg_data 9 red 5990} {chk_cpu.dut_regs_gbox(3) 9 red 6005} -text {} Annotation_8 -position top -window visualize:0
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -comment -arrow {neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en 8 red 6071} {chk_cpu.chosen_reg_flag 9 red 6074} -text {} Annotation_9 -append -window visualize:0; visualize -activate_color_annotation Annotation_9 -window visualize:0
visualize -comment -arrow {chk_cpu.chosen_reg_flag_next 8 red 6109} {chk_cpu.chosen_reg_flag 9 red 6074} -text {} Annotation_9 -append -window visualize:0; visualize -activate_color_annotation Annotation_9 -window visualize:0
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -freeze 0 -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -freeze 0 -window visualize:0
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_chosen_reg_check -new_window
visualize -comment -arrow {chk_cpu.rd 9 red 6873} {chk_cpu.chosen_reg_ndc 9 red 6874} -text {} Annotation_10 -append -window visualize:0; visualize -activate_color_annotation Annotation_10 -window visualize:0
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_chosen_reg_check -new_window
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
check_cov -init -model { branch statement expression toggle functional } -type { stimuli coi proof bound }
include run_cpu_jg.tcl
check_cov -measure -task {<embedded>} -bg
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
check_cov -measure -task {<embedded>} -bg
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_BEQ_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_BEQ_check -new_window
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -comment -arrow {chk_cpu.chosen_reg_flag_next 33 red 7457} {chk_cpu.chosen_reg_flag 33 red 7459} -text {} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
visualize -comment -arrow {neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en 33 red 7458} {chk_cpu.chosen_reg_flag 33 red 7459} -text {} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
visualize -comment -arrow {neorv32_cpu_alu_inst.imm_i 35 green 7435} {neorv32_cpu_control_inst.execute_engine.next_pc 36 green 7430} -text {} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
visualize -comment -arrow {neorv32_cpu_control_inst.execute_engine.next_pc 36 green 7430} {chk_cpu.dut_pc_gbox 40 green 7429} -text {} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
visualize -comment -arrow {neorv32_cpu_control_inst.execute_engine.next_pc 36 green 7430} {chk_cpu.dut_pc_gbox 40 green 7429} -text {} Annotation_11 -remove -window visualize:1
visualize -comment -arrow {neorv32_cpu_alu_inst.imm_i 35 green 7435} {neorv32_cpu_control_inst.execute_engine.next_pc 36 green 7430} -text {} Annotation_11 -remove -window visualize:1
visualize -comment -arrow {neorv32_cpu_alu_inst.imm_i 35 green 7435} {chk_cpu.dut_pc_gbox 35 green 7429} -text {} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
visualize -comment -arrow {chk_cpu.dut_pc_gbox 35 green 7429} {neorv32_cpu_control_inst.execute_engine.next_pc 36 green 7430} -text {} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
visualize -comment -arrow {neorv32_cpu_control_inst.execute_engine.next_pc 36 green 7430} {chk_cpu.dut_pc_gbox 40 green 7429} -text {} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
visualize -comment -arrow {neorv32_cpu_alu_inst.imm_i 35 green 7435} {chk_cpu.dut_pc_gbox 35 green 7429} -text {} Annotation_11 -position top -window visualize:1
visualize -comment -arrow {neorv32_cpu_alu_inst.imm_i 35 green 7435} {chk_cpu.dut_pc_gbox 35 green 7429} -text {} Annotation_11 -position bottom -window visualize:1
visualize -define_color_annotation {{chk_cpu.chosen_reg_data 34 yellow} {chk_cpu.rs1 34 yellow} {chk_cpu.rs2 34 yellow}} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
visualize -comment -arrow {chk_cpu.chosen_reg_data 34 yellow 7445} {chk_cpu.inst_supported 34 yellow 7437} -text {} Annotation_11 -append -window visualize:1; visualize -activate_color_annotation Annotation_11 -window visualize:1
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
check_cov -measure -task {<embedded>} -bg
include run_cpu_jg.tcl
check_cov -measure -task {<embedded>} -bg
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
check_cov -measure -task {<embedded>} -bg
