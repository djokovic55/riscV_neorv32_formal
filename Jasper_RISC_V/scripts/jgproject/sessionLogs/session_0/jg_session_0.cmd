# ----------------------------------------
# Jasper Version Info
# tool      : Jasper 2023.12
# platform  : Linux 3.10.0-1160.88.1.el7.x86_64
# version   : 2023.12p001 64 bits
# build date: 2024.01.23 16:09:24 UTC
# ----------------------------------------
# started   : 2024-10-07 11:45:14 IDT
# hostname  : veri-xn123.qb.veriest.qb.veriest
# pid       : 11314
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:40170' '-style' 'windows' '-data' 'AAAAxHicY2RgYLCp////PwMYMFcBCQEGHwZfhiAGVyDpzxAGpBkYFBhMGYwYLBgMGBwYyhhSGYoYMhl0GYqB7GSgmCmDCUQ/4wMIzWDDyIAKQHwmVJHABhSagYEVphlZkwzQrlKGPIZ4oE0FQFY8QxZDOoMeQwmQnwNWBQDUzxRl' '-proj' '/home/aleksadj/Desktop/RISC_V_PROJECT/Jasper_RISC_V/scripts/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/aleksadj/Desktop/RISC_V_PROJECT/Jasper_RISC_V/scripts/jgproject/.tmp/.initCmds.tcl' 'run_cpu_jg.tcl'

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

check_cov -init
set_prove_time_limit 0s

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
-param CPU_EXTENSION_RISCV_ZICNTR 0 \
-param CPU_EXTENSION_RISCV_ZICOND 0 \
-param CPU_EXTENSION_RISCV_ZIHPM 0 \
-param CPU_EXTENSION_RISCV_ZMMUL 0 \
-param CPU_EXTENSION_RISCV_ZXCFU 0 \
-param CPU_EXTENSION_RISCV_Sdext 0 \
-param CPU_EXTENSION_RISCV_Sdtrig 0 \
-param CPU_EXTENSION_RISCV_Smpmp 0 \
-param FAST_MUL_EN 0 \
-param FAST_SHIFT_EN 0 \
-param REGFILE_HW_RST 1 \
-param PMP_NUM_REGIONS 0 \
-param PMP_MIN_GRANULARITY 4 \
-param PMP_TOR_MODE_EN 1 \
-param PMP_NAP_MODE_EN 1 \
-param HPM_NUM_CNTS 0 \
-param HPM_CNT_WIDTH 40 

# --------------- CLK + RST ---------------- ##


clock {clk_i}
clock {clk_aux_i} 
clock -list configuration
reset {not rstn_i}

## ------------------- Get design info ----------------- ##

# To list design summary
get_design_info


## -------- Sanity check of Clock, Reset, Assumptions ------- ##
# To verify clock/reset setup
sanity_check
# To debug/analyze reset phase
# visualize -reset
# To check for assumption conflicts
check_assumptions

prove -property *_check* -bg


check_cov -measure -task {<embedded>} -bg
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
check_cov -measure -task {<embedded>} -bg
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_BEQ_check -new_window
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.ast_pc_main_BEQ_check:precondition1}
visualize -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_BEQ_check:precondition1 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 5] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -freeze 0 -window visualize:1
include run_cpu_jg.tcl
prove -bg -property {<embedded>::neorv32_cpu.chk_cpu.cov_BEQ}
visualize -property <embedded>::neorv32_cpu.chk_cpu.cov_BEQ -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 4] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_BEQ_check -new_window
visualize -comment -arrow {neorv32_cpu_control_inst.execute_engine.branch_taken 5 red 577} {chk_cpu.dut_pc_gbox 6 red 567} -text {} Annotation_1 -append -window visualize:1; visualize -activate_color_annotation Annotation_1 -window visualize:1
include run_cpu_jg.tcl
visualize -violation -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_pc_BEQ_no_branch_help -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_BEQ_check -new_window
visualize -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_pc_BEQ_no_branch_help:precondition1 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -freeze 0 -window visualize:1
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_pc_main_BEQ_check -new_window
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_next_pc_main_BEQ_check -new_window
include run_cpu_jg.tcl
visualize -violation -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_crd_no_branch_help_new -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 3] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -freeze 0 -window visualize:0
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_crd_rs1_no_branch_help_new -new_window
include run_cpu_jg.tcl
visualize -violation -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_crd_rs1_no_branch_help_new -new_window
include run_cpu_jg.tcl
visualize -violation -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_crd_rs1_no_branch_help_new -new_window
include run_cpu_jg.tcl
visualize -violation -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_crd_rs1_no_branch_help_new -new_window
include run_cpu_jg.tcl
include run_cpu_jg.tcl
include run_cpu_jg.tcl
visualize -violation -property <embedded>::neorv32_cpu.chk_cpu.ast_next_pc_main_BEQ_check -new_window
visualize -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_pc_BEQ_no_branch_help_new:precondition1 -new_window
include run_cpu_jg.tcl
visualize -property pc_BEQ_G::neorv32_cpu.chk_cpu.ast_pc_BEQ_no_branch_help_new:precondition1 -new_window
