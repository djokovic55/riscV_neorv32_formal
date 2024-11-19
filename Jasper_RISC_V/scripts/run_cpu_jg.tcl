
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


set target 0
set lv1 0
set lv2 0
set lv3 1
################################################################################
# SST on top target
################################################################################
if {$target == 1} {

  # assert -disable {*BNE_HELP*}

  ### Mark all assertions with sufix HELP_HIGH as proven helpers -> 
  ### Essentially used as assumptions to reduce the state space during the proof of the target property
  assert -set_helper *MAIN_HELP_HIGH*
  assert -mark_proven *MAIN_HELP_HIGH*

  # Prove the target with helpers used as an assumptions (helpers marked as proven) -> ASSUME NODE
  prove -property *TARGET* -sst 6 -set helper 
  prove -property *TARGET* -with_helpers -bg

  # It is better to prove all helpers together 
  task -create main_target_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {*MAIN_HELP_HIGH*}
  # assert -enable {*BNE_HELP*}
  prove -bg -task {main_target_G}
}


if {$lv1 == 1} {
  ################################################################################
  # SST on LV1 subtargets
  ################################################################################
  ### ASSUME NODE
  set lv1_target "{*next_pc_branch_BEQ*} {*next_pc_increment_BEQ*}"

  task -create subtarget_lv1_A -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy "$lv1_target {*LV1_HELP_HIGH*}"

  assert -set_helper *LV1_HELP_HIGH*
  assert -mark_proven *LV1_HELP_HIGH*

  prove -property $lv1_target -sst 6 -set helper 
  prove -property $lv1_target -with_helpers -bg

  ### GUARANTEE NODE
  # Some of current level subhelpers will be hard to prove and they will become the target for the next sub level
  task -create subtarget_lv1_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {{*LV1_HELP_HIGH*}}
  # prove -bg -task {subtarget_lv1_G}
}

if {$lv2 == 1} {
  ################################################################################
  # SST on LV2 subtargets
  ################################################################################
  ### ASSUME NODE
  set lv2_target "{*branch_decision*}"
  task -create subtarget_lv2_A -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy "$lv2_target {*LV2_HELP_HIGH*}"

  assert -set_helper *LV2_HELP_HIGH*
  assert -mark_proven *LV2_HELP_HIGH*

  prove -property $lv2_target -sst 6 -set helper 
  prove -property $lv2_target -with_helpers -bg

  ### GUARANTEE NODE
  # Some of current level subhelpers will be hard to prove and they will become the target for the next sub level
  task -create subtarget_lv2_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {{*LV2_HELP_HIGH*}}
  prove -bg -task {subtarget_lv2_G}
}

if {$lv3 == 1} {
  ################################################################################
  # SST on lv3 subtargets
  ################################################################################
  ### ASSUME NODE
  set lv3_target "{*ast_chosen_reg_data_branch_match1_BGEU_LV2_HELP_HIGH*}"
  task -create subtarget_lv3_A -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy "$lv3_target {*LV3_HELP_HIGH*}"

  # Mark all assertions with appropriate suffix as helpers
  assert -set_helper *LV3_HELP_HIGH*
  # Mark them as proven (will behave as assumptions, which were proven in _G task)
  assert -mark_proven *LV3_HELP_HIGH*

  # Run SST on target property 
  prove -property $lv3_target -sst 6 -set helper 
  # Prove target property with helpers
  prove -property $lv3_target -with_helpers -bg

  ### GUARANTEE NODE
  # Some of current level subhelpers will be hard to prove and they will become the target for the next sub level
  task -create subtarget_lv3_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {{*LV3_HELP_HIGH*}}
  prove -bg -task {subtarget_lv3_G}
}

proc proof_structure_proc {} {

  task -create PS_SETUP -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy_assert -set 

  # Root node
  proof_structure -init ROOT -from PS_SETUP -copy_all

  # In proof structure feature all helpers should be used in top guarantee node 
  # From there some of them will become targets or remain helpers on sublevels

  # Top node
  set main_target "{*TARGET*}"
  set main_helpers "{*MAIN_HELP_HIGH*} {*LV1_HELP_HIGH*} {*LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from ROOT \
                  -op_name MAIN \
                  -imp_name {MAIN.G MAIN.A} \
                  -property [list ${main_helpers} $main_target]

  ################################################################################
  # BEQ case split
  ################################################################################

  # Lv1 node
  set BEQ_lv1_target "{*next_pc_branch_BEQ*} {*next_pc_increment_BEQ*}"
  set BEQ_lv1_helpers "{*BEQ_LV1_HELP_HIGH*} {*BEQ_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BEQ_LV1 \
                  -imp_name {BEQ_LV1.G BEQ_LV1.A} \
                  -property [list ${BEQ_lv1_helpers} $BEQ_lv1_target]

  # Lv2 node
  set BEQ_lv2_target "{*branch_decision*BEQ_LV1*}"
  set BEQ_lv2_helpers "{*BEQ_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BEQ_LV1.G \
                  -op_name BEQ_LV2 \
                  -imp_name {BEQ_LV2.G BEQ_LV2.A} \
                  -property [list ${BEQ_lv2_helpers} $BEQ_lv2_target]

  ################################################################################
  # BNE case split
  ################################################################################

  # Lv1 node
  set BNE_lv1_target "{*next_pc_branch_BNE*} {*next_pc_increment_BNE*}"
  set BNE_lv1_helpers "{*BNE_LV1_HELP_HIGH*} {*BNE_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BNE_LV1 \
                  -imp_name {BNE_LV1.G BNE_LV1.A} \
                  -property [list ${BNE_lv1_helpers} $BNE_lv1_target]

  # Lv2 node
  set BNE_lv2_target "{*branch_decision*BNE_LV1*}"
  set BNE_lv2_helpers "{*BNE_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BNE_LV1.G \
                  -op_name BNE_LV2 \
                  -imp_name {BNE_LV2.G BNE_LV2.A} \
                  -property [list ${BNE_lv2_helpers} $BNE_lv2_target]

  ################################################################################
  # BLT case split
  ################################################################################

  # Lv1 node
  set BLT_lv1_target "{*next_pc_branch_BLT_*} {*next_pc_increment_BLT_*}"
  set BLT_lv1_helpers "{*BLT_LV1_HELP_HIGH*} {*BLT_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BLT_LV1 \
                  -imp_name {BLT_LV1.G BLT_LV1.A} \
                  -property [list ${BLT_lv1_helpers} $BLT_lv1_target]

  # Lv2 node
  set BLT_lv2_target "{*branch_decision*BLT_LV1*}"
  set BLT_lv2_helpers "{*BLT_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BLT_LV1.G \
                  -op_name BLT_LV2 \
                  -imp_name {BLT_LV2.G BLT_LV2.A} \
                  -property [list ${BLT_lv2_helpers} $BLT_lv2_target]

  ################################################################################
  # BLTU case split
  ################################################################################

  # Lv1 node
  set BLTU_lv1_target "{*next_pc_branch_BLTU_*} {*next_pc_increment_BLTU_*}"
  set BLTU_lv1_helpers "{*BLTU_LV1_HELP_HIGH*} {*BLTU_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BLTU_LV1 \
                  -imp_name {BLTU_LV1.G BLTU_LV1.A} \
                  -property [list ${BLTU_lv1_helpers} $BLTU_lv1_target]

  # Lv2 node
  set BLTU_lv2_target "{*branch_decision*BLTU_LV1*}"
  set BLTU_lv2_helpers "{*BLTU_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BLTU_LV1.G \
                  -op_name BLTU_LV2 \
                  -imp_name {BLTU_LV2.G BLTU_LV2.A} \
                  -property [list ${BLTU_lv2_helpers} $BLTU_lv2_target]

  ################################################################################
  # BGE case split
  ################################################################################

  # Lv1 node
  set BGE_lv1_target "{*next_pc_branch_BGE_*} {*next_pc_increment_BGE_*}"
  set BGE_lv1_helpers "{*BGE_LV1_HELP_HIGH*} {*BGE_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BGE_LV1 \
                  -imp_name {BGE_LV1.G BGE_LV1.A} \
                  -property [list ${BGE_lv1_helpers} $BGE_lv1_target]

  # Lv2 node
  set BGE_lv2_target "{*branch_decision*BGE_LV1*}"
  set BGE_lv2_helpers "{*BGE_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BGE_LV1.G \
                  -op_name BGE_LV2 \
                  -imp_name {BGE_LV2.G BGE_LV2.A} \
                  -property [list ${BGE_lv2_helpers} $BGE_lv2_target]

  ################################################################################
  # BGEU case split
  ################################################################################

  # Lv1 node
  set BGEU_lv1_target "{*next_pc_branch_BGEU_*} {*next_pc_increment_BGEU_*}"
  set BGEU_lv1_helpers "{*BGEU_LV1_HELP_HIGH*} {*BGEU_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BGEU_LV1 \
                  -imp_name {BGEU_LV1.G BGEU_LV1.A} \
                  -property [list ${BGEU_lv1_helpers} $BGEU_lv1_target]

  # Lv2 node
  set BGEU_lv2_target "{*branch_decision*BGEU_LV1*}"
  set BGEU_lv2_helpers "{*BGEU_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BGEU_LV1.G \
                  -op_name BGEU_LV2 \
                  -imp_name {BGEU_LV2.G BGEU_LV2.A} \
                  -property [list ${BGEU_lv2_helpers} $BGEU_lv2_target]
  # prove -task MAIN.A -bg
  # prove -task LV1.A -bg
  # prove -task LV2.A -bg
  # prove -task LV2.G -bg
}

# proof_structure_proc