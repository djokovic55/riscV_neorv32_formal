module  checker_top

// Parameter List

#(
////////////////////////////////////////////////////////////
// General
/////////////////////////////////////////////////////////////

// The clock frequency of the processor’s clk_i input port in Hertz (Hz).
parameter CLOCK_FREQUENCY = 16,
// Enable clock gating when CPU is in sleep mode (see sections Sleep Mode and Processor Clocking).
parameter CLOCK_GATING_EN = 0,
// Implement the processor-internal Bootloader ROM (BOOTROM), pre-initialized with the default Bootloader image.
parameter INT_BOOTLOADER_EN = 0,
// The hart thread ID of the CPU (passed to mhartid CSR).
parameter HART_ID = 0,
// JEDEC ID; continuation codes plus vendor ID (passed to mvendorid CSR and to the Debug Transport Module (DTM)).
parameter JEDEC_ID = 0,
////////////////////////////////////////////////
// On-Chip Debugger (OCD)
////////////////////////////////////////////////
// Implement the on-chip debugger and the CPU debug mode.
parameter ON_CHIP_DEBUGGER_EN = 0,
// Debug module spec. version: false = v1.0, true = v0.13 (legacy mode).
parameter DM_LEGACY_MODE = 0,
//////////////////////////////////////////////////
// CPU Instruction Sets and Extensions
//////////////////////////////////////////////////
parameter CPU_EXTENSION_RISCV_A = 0,
parameter CPU_EXTENSION_RISCV_B = 0,
parameter CPU_EXTENSION_RISCV_C = 0,
parameter CPU_EXTENSION_RISCV_E = 0,
parameter CPU_EXTENSION_RISCV_M = 0,
parameter CPU_EXTENSION_RISCV_U = 0,
parameter CPU_EXTENSION_RISCV_ZFINX = 0,
parameter CPU_EXTENSION_RISCV_ZICNTR = 1,
parameter CPU_EXTENSION_RISCV_ZICOND = 0,
parameter CPU_EXTENSION_RISCV_ZIHPM = 0,
parameter CPU_EXTENSION_RISCV_ZMMUL = 0,
parameter CPU_EXTENSION_RISCV_ZXCFU = 0,
///////////////////////////////////////////////////////////////////
// CPU Architecture Tuning Options
////////////////////////////////////////////////////////////////////
parameter FAST_MUL_EN = 0,
parameter FAST_SHIFT_EN = 0,
parameter REGFILE_HW_RST = 0,
///////////////////////////////////////////////////////////////////////
// Physical Memory Protection (Smpmp ISA Extension)
///////////////////////////////////////////////////////////////////////
parameter PMP_NUM_REGIONS = 0,
parameter PMP_MIN_GRANULARITY = 4,
parameter PMP_TOR_MODE_EN = 1,
parameter PMP_NAP_MODE_EN = 1,
////////////////////////////////////////////////////////////////////////
// Hardware Performance Monitors (Zihpm ISA Extension)
/////////////////////////////////////////////////////////////////////////
parameter HPM_NUM_CNTS = 0,
parameter HPM_CNT_WIDTH = 40,
/////////////////////////////////////////////////////////////////////////////
// Internal Instruction Memory (IMEM)
/////////////////////////////////////////////////////////////////////////////
parameter MEM_INT_IMEM_EN = 0,
parameter MEM_INT_IMEM_SIZE = 16*1024,
/////////////////////////////////////////////////////////////////////////////////
// Internal Data Memory (DMEM)
//////////////////////////////////////////////////////////////////////////////////
parameter MEM_INT_DMEM_EN = 0,
parameter MEM_INT_DMEM_SIZE = 8*1024,
/////////////////////////////////////////////////////////////////////////////////////
// Processor-Internal Instruction Cache (iCACHE)
/////////////////////////////////////////////////////////////////////////////////////
parameter ICACHE_EN = 0,
parameter ICACHE_NUM_BLOCKS = 4,
parameter ICACHE_BLOCK_SIZE = 64,
///////////////////////////////////////////////////////////////////////////////////////////
// Processor-Internal Data Cache (dCACHE)
////////////////////////////////////////////////////////////////////////////////////////////
parameter DCACHE_EN = 0,
parameter DCACHE_NUM_BLOCKS = 4,
parameter DCACHE_BLOCK_SIZE = 64,
////////////////////////////////////////////////////////////////////////////////////////////////
// Processor-External Bus Interface (XBUS) (Wishbone b4 protocol)
////////////////////////////////////////////////////////////////////////////////////////////////
parameter XBUS_EN = 0,
parameter XBUS_TIMEOUT = 255,
parameter XBUS_REGSTAGE_EN = 0,
parameter XBUS_CACHE_EN = 0,
parameter XBUS_CACHE_NUM_BLOCKS = 64,
parameter XBUS_CACHE_BLOCK_SIZE = 32,
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Execute In Place Module (XIP)
//////////////////////////////////////////////////////////////////////////////////////////////////////////
parameter XIP_EN = 0,
parameter XIP_CACHE_EN = 0,
parameter XIP_CACHE_NUM_BLOCKS = 8,
parameter XIP_CACHE_BLOCK_SIZE = 256,
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// External Interrupt Controller (XIRQ)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
parameter XIRQ_NUM_CH = 0,
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// External Interrupt Controller (XIRQ)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
parameter IO_DISABLE_SYSINFO = 0,
parameter IO_GPIO_NUM = 0,
parameter IO_MTIME_EN = 0,
parameter IO_UART0_EN = 0,
parameter IO_UART0_RX_FIFO = 1,
parameter IO_UART0_TX_FIFO = 1,
parameter IO_UART1_EN = 0,
parameter IO_UART1_RX_FIFO = 1,
parameter IO_UART1_TX_FIFO = 1,
parameter IO_SPI_EN = 0,
parameter IO_SPI_FIFO = 1,
parameter IO_SDI_EN = 0,
parameter IO_SDI_FIFO = 1,
parameter IO_TWI_EN = 0,
parameter IO_TWI_FIFO = 1,
parameter IO_PWM_NUM_CH = 0,
parameter IO_WDT_EN = 0,
parameter IO_TRNG_EN = 0,
parameter IO_TRNG_FIFO = 1,
parameter IO_CFS_EN = 0,
parameter IO_CFS_CONFIG = 0,
parameter IO_CFS_IN_SIZE = 32,
parameter IO_CFS_OUT_SIZE = 32,
parameter IO_NEOLED_EN = 0,
parameter IO_NEOLED_TX_FIFO = 1,
parameter IO_GPTMR_EN = 0,
parameter IO_ONEWIRE_EN = 0,
parameter IO_DMA_EN = 0,
parameter IO_SLINK_EN = 0,
parameter IO_SLINK_RX_FIFO = 1,
parameter IO_SLINK_TX_FIFO = 1,
parameter IO_CRC_EN = 0

)

// Signal List

(

// Global Control (Processor Clocking and Processor Reset)

input clk_i,
input rstn_i,

// JTAG Access Port for On-Chip Debugger (OCD)

input jtag_tck_i,
input jtag_tdi_i,
input jtag_tdo_o,
input jtag_tms_i,

// Processor-External Bus Interface (XBUS)
input [31:0] xbus_adr_o,
input [31:0] xbus_dat_o,
input [2:0]  xbus_tag_o,
input        xbus_we_o,
input [3:0]  xbus_sel_o,
input        xbus_stb_o,
input        xbus_cyc_o,
input [31:0] xbus_dat_i,
input        xbus_ack_i,
input        xbus_err_i,

// Stream Link Interface (SLINK)
input [31:0] slink_rx_dat_i,
input [3:0]  slink_rx_src_i,
input        slink_rx_val_i,
input        slink_rx_lst_i,
input        slink_rx_rdy_o,
input [31:0] slink_tx_dat_o,
input [3:0]  slink_tx_dst_o,
input        slink_tx_val_o,
input        slink_tx_lst_o,
input        slink_tx_rdy_i,

// Execute In Place Module (XIP)
input        xip_csn_o,
input        xip_clk_o,
input        xip_dat_i,
input        xip_dat_o,

// General Purpose Input and Output Port (GPIO)
input [63:0] gpio_o,
input [63:0] gpio_i,

// Primary Universal Asynchronous Receiver and Transmitter (UART0)
input        uart0_txd_o,
input        uart0_rxd_i,
input        uart0_rts_o,
input        uart0_cts_i,

// Secondary Universal Asynchronous Receiver and Transmitter (UART1)
input        uart1_txd_o,
input        uart1_rxd_i,
input        uart1_rts_o,
input        uart1_cts_i,

// Serial Peripheral Interface Controller (SPI)
input        spi_clk_o,
input        spi_dat_o,
input        spi_dat_i,
input [7:0]  spi_csn_o,

// Serial Data Interface Controller (SDI)
input        sdi_clk_i,
input        sdi_dat_o,
input        sdi_dat_i,
input        sdi_csn_i,

// Two-Wire Serial Interface Controller (TWI)
input        twi_sda_i,
input        twi_sda_o,
input        twi_scl_i,
input        twi_scl_o,

// One-Wire Serial Interface Controller (ONEWIRE)
input        onewire_i,
input        onewire_o,

// Pulse-Width Modulation Controller (PWM)
input [11:0] pwm_o,

// Custom Functions Subsystem (CFS)
input [31:0] cfs_in_i,
input [31:0] cfs_out_o,

// Smart LED Interface (NEOLED)
input        neoled_o,

// Machine System Timer (MTIME)
input [63:0] mtime_time_o,

// External Interrupt Controller (XIRQ)
input [31:0] xirq_i,

// RISC-V Machine-Mode Processor Interrupts
input        mtime_irq_i,
input        msw_irq_i,
input        mext_irq_i




);



endmodule