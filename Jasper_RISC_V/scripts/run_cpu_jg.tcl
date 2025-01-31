
clear -all
include Jasper_RISC_V/scripts/sst/ps_neorv32_cpu.tcl
include Jasper_RISC_V/scripts/sst/sst_neorv32_cpu.tcl
## ----------------- ANALYZE COMMANDS ------------------ ##
## -------------- To Analyze VHDL Files ---------------- ##

analyze -vhdl -lib neorv32 -f RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_cpu.f
analyze -vhdl -f RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_cpu.f
## --------------- To Analyze SV Files ----------------- ##

analyze -sv Jasper_RISC_V/env/checks/checker_cpu.sv
analyze -sv Jasper_RISC_V/env/cpu_bind.sv

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

# SST procs
# run_sst_main_proc
# run_sst_lv1_proc
# run_sst_lv2_proc
# run_sst_lv3_proc

# Proof structure proc
# run_proof_structure_proc