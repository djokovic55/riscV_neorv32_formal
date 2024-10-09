clear -all

set proj_dir "/home/aleksadj/Desktop/RISC_V_PROJECT"
## -------------- To Analyze VHDL Files ---------------- ##
# analyze -vhdl -lib neorv32 {/home/tivadarm/RISC_V_NEORV32/neorv32-main/rtl/core/neorv32_package.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_clockgate.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_fifo.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_decompressor.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_control.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_regfile.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_shifter.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_muldiv.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_bitmanip.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_fpu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_cfu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_cp_cond.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_alu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_lsu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu_pmp.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cpu.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_intercon.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cache.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_dma.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_imem.entity.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_dmem.entity.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_boot_rom.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_xip.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_xbus.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_cfs.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_sdi.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_gpio.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_wdt.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_mtime.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_uart.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_spi.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_twi.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_pwm.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_trng.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_neoled.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_xirq.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_gptmr.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_onewire.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_slink.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_crc.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_sysinfo.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_debug_dtm.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_debug_dm.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_top.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_bootloader_image.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/neorv32_application_image.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/mem/neorv32_imem.legacy.vhd /home/tivadarm/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/core/mem/neorv32_dmem.legacy.vhd}

## ----------------- ANALYZE COMMANDS ------------------ ##
## -------------- To Analyze VHDL Files ---------------- ##

analyze -vhdl -lib neorv32 -f $proj_dir/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_soc.f
analyze -vhdl -f $proj_dir/RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_soc.f

## --------------- To Analyze SV Files ----------------- ##

analyze -sv $proj_dir/Jasper_RISC_V/env/checks/checker_top.sv
analyze -sv $proj_dir/Jasper_RISC_V/env/top_bind.sv


## --------------- ELABORATION COMMANDS ---------------- ##
# Elaborate command with black-box modules and instances
# FAST_MUL_EN -> Disable FAST MULTI as it will be blackboxed anyway
# Pay attention to IMEM, DMEM, ICACHE and DCAHCE SIZE
elaborate -vhdl -top {neorv32_top} \
-param CLOCK_FREQUENCY 8 \
-param INT_BOOTLOADER_EN 1 \
-param ON_CHIP_DEBUGGER_EN 1 \
-param CPU_EXTENSION_RISCV_A 1 \
-param CPU_EXTENSION_RISCV_B 1 \
-param CPU_EXTENSION_RISCV_C 1 \
-param CPU_EXTENSION_RISCV_E 1 \
-param CPU_EXTENSION_RISCV_M 1 \
-param CPU_EXTENSION_RISCV_U 1 \
-param CPU_EXTENSION_RISCV_Zfinx 1 \
-param CPU_EXTENSION_RISCV_Zicntr 1 \
-param CPU_EXTENSION_RISCV_Zicond 1 \
-param CPU_EXTENSION_RISCV_Zihpm 1 \
-param CPU_EXTENSION_RISCV_Zmmul 1 \
-param CPU_EXTENSION_RISCV_Zxcfu 1 \
-param FAST_MUL_EN 0 \
-param FAST_SHIFT_EN 1 \
-param HPM_NUM_CNTS 2 \
-param MEM_INT_IMEM_EN 1 \
-param MEM_INT_IMEM_SIZE 1024 \
-param MEM_INT_DMEM_EN 1 \
-param MEM_INT_DMEM_SIZE 1024 \
-param ICACHE_EN 1 \
-param ICACHE_NUM_BLOCKS 4 \
-param ICACHE_BLOCK_SIZE 64 \
-param DCACHE_EN 1 \
-param DCACHE_NUM_BLOCKS 4 \
-param DCACHE_BLOCK_SIZE 64 \
-param XBUS_EN 1 \
-param XBUS_REGSTAGE_EN 1 \
-param XBUS_CACHE_EN 1 \
-param XIP_EN 1 \
-param XIP_CACHE_EN 1 \
-param XIRQ_NUM_CH 32 \
-param IO_GPIO_NUM 1 \
-param IO_MTIME_EN 1 \
-param IO_UART0_EN 1 \
-param IO_UART1_EN 1 \
-param IO_SPI_EN 1 \
-param IO_SDI_EN 1 \
-param IO_TWI_EN 1 \
-param IO_WDT_EN 1 \
-param IO_TRNG_EN 1 \
-param IO_NEOLED_EN 1 \
-param IO_GPTMR_EN 1 \
-param IO_ONEWIRE_EN 1 \
-param IO_DMA_EN 1 \
-param IO_SLINK_EN 1 \
-param IO_CRC_EN 1


## --------------- CLK + RST ---------------- ##


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



