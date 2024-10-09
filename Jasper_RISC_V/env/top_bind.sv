// First add parameter values to RTL
// Connect Parameters from RTL to Checker
// Connect Signals from RTL to Checker

bind neorv32_top checker_top #(

.CLOCK_FREQUENCY(CLOCK_FREQUENCY),
.INT_BOOTLOADER_EN(INT_BOOTLOADER_EN),
.ON_CHIP_DEBUGGER_EN(ON_CHIP_DEBUGGER_EN),
.CPU_EXTENSION_RISCV_A(CPU_EXTENSION_RISCV_A),
.CPU_EXTENSION_RISCV_B(CPU_EXTENSION_RISCV_B),
.CPU_EXTENSION_RISCV_C(CPU_EXTENSION_RISCV_C),
.CPU_EXTENSION_RISCV_E(CPU_EXTENSION_RISCV_E),
.CPU_EXTENSION_RISCV_M(CPU_EXTENSION_RISCV_M),
.CPU_EXTENSION_RISCV_U(CPU_EXTENSION_RISCV_U),
.CPU_EXTENSION_RISCV_ZFINX(CPU_EXTENSION_RISCV_Zfinx),
.CPU_EXTENSION_RISCV_ZICNTR(CPU_EXTENSION_RISCV_Zicntr),
.CPU_EXTENSION_RISCV_ZICOND(CPU_EXTENSION_RISCV_Zicond),
.CPU_EXTENSION_RISCV_ZIHPM(CPU_EXTENSION_RISCV_Zihpm),
.CPU_EXTENSION_RISCV_ZMMUL(CPU_EXTENSION_RISCV_Zmmul),
.CPU_EXTENSION_RISCV_ZXCFU(CPU_EXTENSION_RISCV_Zxcfu),
.FAST_MUL_EN(FAST_MUL_EN),
.FAST_SHIFT_EN(FAST_SHIFT_EN),
.HPM_NUM_CNTS(HPM_NUM_CNTS),
.MEM_INT_IMEM_EN(MEM_INT_IMEM_EN),
.MEM_INT_DMEM_EN(MEM_INT_DMEM_EN),
.ICACHE_EN(ICACHE_EN),
.DCACHE_EN(DCACHE_EN),
.XBUS_EN(XBUS_EN),
.XBUS_REGSTAGE_EN(XBUS_REGSTAGE_EN),
.XBUS_CACHE_EN(XBUS_CACHE_EN),
.XIP_EN(XIP_EN),
.XIP_CACHE_EN(XIP_CACHE_EN),
.XIRQ_NUM_CH(XIRQ_NUM_CH),
.IO_GPIO_NUM(IO_GPIO_NUM),
.IO_MTIME_EN(IO_MTIME_EN),
.IO_UART0_EN(IO_UART0_EN),
.IO_UART1_EN(IO_UART1_EN),
.IO_SPI_EN(IO_SPI_EN),
.IO_SDI_EN(IO_SDI_EN),
.IO_TWI_EN(IO_TWI_EN),
.IO_WDT_EN(IO_WDT_EN),
.IO_TRNG_EN(IO_TRNG_EN),
.IO_NEOLED_EN(IO_NEOLED_EN),
.IO_GPTMR_EN(IO_GPTMR_EN),
.IO_ONEWIRE_EN(IO_ONEWIRE_EN),
.IO_DMA_EN(IO_DMA_EN),
.IO_SLINK_EN(IO_SLINK_EN),
.IO_CRC_EN(IO_CRC_EN)


)


chk_top(


// Signal List



// Global Control (Processor Clocking and Processor Reset)

.clk_i(clk_i),
.rstn_i(rstn_i),

// JTAG Access Port for On-Chip Debugger (OCD)

.jtag_tck_i(jtag_tck_i),
.jtag_tdi_i(jtag_tdi_i),
.jtag_tdo_o(jtag_tdo_o),
.jtag_tms_i(jtag_tms_i),

// Processor-External Bus Interface (XBUS)
.xbus_adr_o(xbus_adr_o),
.xbus_dat_o(xbus_dat_o),
.xbus_tag_o(xbus_tag_o),
.xbus_we_o(xbus_we_o),
.xbus_sel_o(xbus_sel_o),
.xbus_stb_o(xbus_stb_o),
.xbus_cyc_o(xbus_cyc_o),
.xbus_dat_i(xbus_dat_i),
.xbus_ack_i(xbus_ack_i),
.xbus_err_i(xbus_err_i),

// Stream Link Interface (SLINK)
.slink_rx_dat_i(slink_rx_dat_i),
.slink_rx_src_i(slink_rx_src_i),
.slink_rx_val_i(slink_rx_val_i),
.slink_rx_lst_i(slink_rx_lst_i),
.slink_rx_rdy_o(slink_rx_rdy_o),
.slink_tx_dat_o(slink_tx_dat_o),
.slink_tx_dst_o(slink_tx_dst_o),
.slink_tx_val_o(slink_tx_val_o),
.slink_tx_lst_o(slink_tx_lst_o),
.slink_tx_rdy_i(slink_tx_rdy_i),

// Execute In Place Module (XIP)
.xip_csn_o(xip_csn_o),
.xip_clk_o(xip_clk_o),
.xip_dat_i(xip_dat_i),
.xip_dat_o(xip_dat_o),

// General Purpose and Output Port (GPIO)
.gpio_o(gpio_o),
.gpio_i(gpio_i),

// Primary Universal Asynchronous Receiver and Transmitter (UART0)
.uart0_txd_o(uart0_txd_o),
.uart0_rxd_i(uart0_rxd_i),
.uart0_rts_o(uart0_rts_o),
.uart0_cts_i(uart0_cts_i),

// Secondary Universal Asynchronous Receiver and Transmitter (UART1)
.uart1_txd_o(uart1_txd_o),
.uart1_rxd_i(uart1_rxd_i),
.uart1_rts_o(uart1_rts_o),
.uart1_cts_i(uart1_cts_i),

// Serial Peripheral Interface Controller (SPI)
.spi_clk_o(spi_clk_o),
.spi_dat_o(spi_dat_o),
.spi_dat_i(spi_dat_i),
.spi_csn_o(spi_csn_o),

// Serial Data Interface Controller (SDI)
.sdi_clk_i(sdi_clk_i),
.sdi_dat_o(sdi_dat_o),
.sdi_dat_i(sdi_dat_i),
.sdi_csn_i(sdi_csn_i),

// Two-Wire Serial Interface Controller (TWI)
.twi_sda_i(twi_sda_i),
.twi_sda_o(twi_sda_o),
.twi_scl_i(twi_scl_i),
.twi_scl_o(twi_scl_o),

// One-Wire Serial Interface Controller (ONEWIRE)
.onewire_i(onewire_i),
.onewire_o(onewire_o),

// Pulse-Width Modulation Controller (PWM)
.pwm_o(pwm_o),

// Custom Functions Subsystem (CFS)
.cfs_in_i(cfs_in_i),
.cfs_out_o(cfs_out_o),

// Smart LED Interface (NEOLED)
.neoled_o(neoled_o),

// Machine System Timer (MTIME)
.mtime_time_o(mtime_time_o),

// External Interrupt Controller (XIRQ)
.xirq_i(xirq_i),

// RISC-V Machine-Mode Processor Interrupts
.mtime_irq_i(mtime_irq_i),
.msw_irq_i(msw_irq_i),
.mext_irq_i(mext_irq_i)


);
