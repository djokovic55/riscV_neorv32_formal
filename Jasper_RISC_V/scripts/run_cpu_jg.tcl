
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

################################################################################
# SST on top target
################################################################################

# assert -disable {*BNE_HELP*}

### Mark all assertions with sufix HELP_HIGH as proven helpers -> 
### Essentially used as assumptions to reduce the state space during the proof of the target property
assert -set_helper *HELP_HIGH*
assert -mark_proven *HELP_HIGH*

# Prove the target with helpers used as an assumptions (helpers marked as proven) -> ASSUME NODE
# prove -property *SUBTARGET_LV1* -sst 6 -set helper 
# prove -property *SUBTARGET_LV1* -with_helpers -bg

### Guarantee node where new helpers should be proven first -> GUARANTEE NODE
# task -create pc_BEQ_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {*HELP_HIGH_NEW*}
# prove -bg -task {pc_BEQ_G}

# task -create target_sanity_check -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {*TARGET}
# prove -bg -task {target_sanity_check}

# It is better to prove all helpers together 
# task -create helpers_sanity_check -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {*HELP_HIGH*}
# assert -enable {*BNE_HELP*}
# prove -bg -task {helpers_sanity_check}


################################################################################
# SST on LV1 subtargets
################################################################################
### ASSUME NODE
task -create subtarget_lv1_A -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {{*SUBTARGET_LV1*} {*SUBHELP_LV1_HIGH*}}

assert -set_helper *SUBHELP_LV1_HIGH*
assert -mark_proven *SUBHELP_LV1_HIGH*

prove -property *SUBTARGET_LV1* -sst 6 -set helper 
prove -property *SUBTARGET_LV1* -with_helpers -bg

### GUARANTEE NODE
task -create subtarget_lv1_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {*SUBHELP_LV1_HIGH*}
prove -bg -task {subtarget_lv1_G}