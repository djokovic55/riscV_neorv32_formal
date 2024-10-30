
module  checker_cpu

// Parameter List

#(
////////////////////////////////////////////////////////////
// General
/////////////////////////////////////////////////////////////

// The hart thread ID of the CPU (passed to mhartid CSR).
parameter HART_ID = 0,

// vendor's JEDEC ID
parameter VENDOR_ID = 0,
// cpu boot address
parameter CPU_BOOT_ADDR = 0,
// cpu debug mode parking loop entry address
parameter CPU_DEBUG_PARK_ADDR = 0,
// cpu debug mode exception entry address
parameter CPU_DEBUG_EXC_ADDR = 0,

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
parameter CPU_EXTENSION_RISCV_ZICNTR = 0,
parameter CPU_EXTENSION_RISCV_ZICOND = 0,
parameter CPU_EXTENSION_RISCV_ZIHPM = 0,
parameter CPU_EXTENSION_RISCV_ZMMUL = 0,
parameter CPU_EXTENSION_RISCV_ZXCFU = 0,

parameter CPU_EXTENSION_RISCV_Sdext = 0,
parameter CPU_EXTENSION_RISCV_Sdtrig = 0,
parameter CPU_EXTENSION_RISCV_Smpmp = 0,
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
parameter HPM_CNT_WIDTH = 40

)

// Signal List

(

// Global Control (Processor Clocking and Processor Reset)

input clk_i,
input clk_aux_i,
input rstn_i,
input sleep_o,
input debug_o,
// interrupts --
input msi_i,
input mei_i,
input mti_i,
input[15:0] firq_i,
input dbi_i,
// instruction bus interface --
input[73:0] ibus_req_o,
input[33:0] ibus_rsp_i,
// data bus interface --
input[73:0] dbus_req_o,
input[33:0] dbus_rsp_i

);


  default 
  clocking @(posedge clk_i);
  endclocking

  default disable iff !rstn_i;
  ////////////////////////////////////////////////////////////////////////////////
  // FUNCTIONS
  ////////////////////////////////////////////////////////////////////////////////
  function void pc_inc;
    begin
        tb_pc_next = dut_pc_gbox + 4;
    end
  endfunction

  function void next_pc_assign;
    input [XLEN-1:0] newval;
    begin
        tb_pc_next = newval;
    end
  endfunction

  // function void pc_unknown;
  //   begin
  //       tb_pc_next = '0;
  //   end
  // endfunction // pc_unknown

  ////////////////////////////////////////////////////////////////////////////////
  // PARAMETERS
  ////////////////////////////////////////////////////////////////////////////////

  localparam XLEN = 32;
  typedef struct packed
                {
                  logic known;
                  logic [XLEN-1:0] value;
                } pc_t;

  typedef struct packed
                {
                  logic [XLEN/8 -1:0] known;//We have 1 known bit for each byte in value
                  logic [XLEN-1:0]    value;
                } reg_t;
  
  parameter [6:0] OPCODE_JAL = 7'b1101111;
  parameter [6:0] OPCODE_JALR = 7'b1100111;
  parameter [6:0] OPCODE_BRANCH = 7'b1100011;
  // parameter [6:0] OPCODE_ALU = 7'b0110011;

  parameter [6:0] OPCODE_ALUI = 7'b0010011;
  parameter [6:0] OPCODE_ALUR = 7'b0110011;

  typedef enum {DISPATCH, TRAP_ENTER, TRAP_EXIT, RESTART, FENCE, SLEEP,
                                  EXECUTE, ALU_WAIT, BRANCH, BRANCHED, SYSTEM, MEM_REQ, MEM_WAIT} exec_state_t;

  // funct3 fields
  // BRANCH 
  parameter [2:0] BEQ = 3'b000;
  parameter [2:0] BNE = 3'b001;
  parameter [2:0] BLT = 3'b100;
  parameter [2:0] BGE = 3'b101;
  parameter [2:0] BLTU = 3'b110;
  parameter [2:0] BGEU = 3'b111;
  // ALUI
  parameter [2:0] ADDI = 3'b000;

  // ALUR
  parameter [2:0] ADD_SUB = 3'b000;
  parameter [2:0] OR_funct3 = 3'b110;
  // funct7 fields
  parameter [6:0] SUB = 7'b0100000;
  parameter [6:0] OR_funct7 = 7'b0000000;
  ////////////////////////////////////////////////////////////////////////////////
  // INSTRUCTION SWITHCES
  ////////////////////////////////////////////////////////////////////////////////
  // R type
  parameter SUB_SWITCH = 1'b1;
  parameter OR_SWITCH = 1'b1;
  // I type
  parameter ADDI_SWITCH = 1'b1;
  // B type
  parameter BEQ_SWITCH = 1'b1;
  parameter BNE_SWITCH = 1'b1;
  parameter BLT_SWITCH = 1'b1;
  parameter BGE_SWITCH = 1'b1;
  parameter BLTU_SWITCH = 1'b1;
  parameter BGEU_SWITCH = 1'b1;
  // J type
  parameter JAL_SWITCH = 1'b1;
  parameter JALR_SWITCH = 1'b1;

  ////////////////////////////////////////////////////////////////////////////////
  // GRAY BOX SIGNALS
  ////////////////////////////////////////////////////////////////////////////////

  exec_state_t exec_state_gbox;
  assign exec_state_gbox = neorv32_cpu_control_inst.execute_engine.state;

  logic[31:0] dut_pc_gbox;
  assign dut_pc_gbox = neorv32_cpu_control_inst.execute_engine.pc;
  
  logic[31:0] dut_next_pc_gbox;
  assign dut_next_pc_gbox = neorv32_cpu_control_inst.execute_engine.next_pc;

  logic pc_we_gbox;
  assign pc_we_gbox = neorv32_cpu_control_inst.execute_engine.pc_we;

  logic jump_ir_gbox;
  assign jump_ir_gbox = (opcode_gbox == OPCODE_JAL || opcode_gbox == OPCODE_JALR || opcode_gbox == OPCODE_BRANCH);

  logic[31:0] dut_inst_gbox;
  assign dut_inst_gbox = neorv32_cpu_control_inst.execute_engine.ir;

  logic[6:0] funct7;
  assign funct7 = dut_inst_gbox[31:25];

  logic[2:0] funct3;
  assign funct3 = dut_inst_gbox[14:12];

  logic[6:0] opcode_gbox;
  assign opcode_gbox = neorv32_cpu_control_inst.decode_aux.opcode;

  logic[31:0][31:0] dut_regs_gbox;
  assign dut_regs_gbox = neorv32_cpu_regfile_inst.reg_file;

  logic branch_taken;
  assign branch_taken = neorv32_cpu_control_inst.execute_engine.branch_taken;

  logic regs_we_gbox;
  assign regs_we_gbox = neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en;

  logic[31:0] next_ir_gbox;
  assign next_ir_gbox = neorv32_cpu_control_inst.execute_engine.ir_nxt;

  logic[31:0] imm_gbox;
  assign imm_gbox = neorv32_cpu_alu_inst.imm_i;
  ////////////////////////////////////////////////////////////////////////////////
  // AUX CODE 
  ////////////////////////////////////////////////////////////////////////////////

  // FREE VARIABLE - keeps track about one reg at a time
  logic[4:0] chosen_reg_ndc;
  logic[31:0] chosen_reg_data, chosen_reg_data_next;
  logic chosen_reg_flag, chosen_reg_flag_next;
  logic chosen_reg_update_allowed;

  asm_chosen_reg_stability: assume property($stable(chosen_reg_ndc));

  // assign chosen_reg_update_fence = (rd == chosen_reg_ndc) && !inst_supported && chosen_reg_flag && regs_we_gbox;

  logic trap_event;
  logic mem_req;
  logic exception;

  // Illegal command or exception
  always_ff @(posedge clk_i) begin
    if(!rstn_i) begin
        trap_event <= 1'b0;
        mem_req <= 1'b0;
    end
    else begin
      // Illegal command or exception
      if(exec_state_gbox == TRAP_ENTER || exec_state_gbox == TRAP_EXIT)
        trap_event <= 1'b1;
      else if (pc_we_gbox) begin
        trap_event <= 1'b0;
      end
      // Memory access
      if(exec_state_gbox == MEM_REQ)
        mem_req <= 1'b1;

    end
  end
  // JALR instr edge detector
  logic jalr_edge, jalr_prev;
  logic jalr_inst;
  // not needed, assigned from comb block
  // assign jalr_inst = (opcode_gbox == OPCODE_JALR);

  logic pc_we_delayed;
  logic jalr_edge2;


  always_ff @(posedge clk_i) begin
    jalr_prev <= jalr_inst;
    pc_we_delayed <= pc_we_gbox;
  end

  assign jalr_edge = (jalr_inst && !jalr_prev);
  assign jalr_edge2 = (pc_we_delayed & jalr_inst);
  // cov_jalr_edge_check: cover property(jalr_edge);

  // Currently we do not understand fully these events
  // In the main check they will be excluded as an exception
  assign exception = mem_req | trap_event;
  // assign exception = 1'b0;

  logic[31:0] tb_pc, tb_pc_next;
  logic[4:0] rd, rs1, rs2;
  logic inst_supported;
  logic[11:0] imm12;
  logic[31:0] imm32;
  logic[31:0] rs1_data, rs2_data, rd_data;
  logic[31:0] pc_jalr;

  logic signed_imm32;
  logic unsigned_imm32;

  logic beq1_taken, beq2_taken, beq_not_taken, beq1_not_taken, beq2_not_taken;
  logic bne1_taken, bne2_taken, bne_not_taken, bne1_not_taken, bne2_not_taken;
  logic blt1_taken, blt2_taken, blt_not_taken, blt1_not_taken, blt2_not_taken;
  logic bge1_taken, bge2_taken, bge_not_taken, bge1_not_taken, bge2_not_taken;
  logic bltu1_taken, bltu2_taken, bltu_not_taken, bltu1_not_taken, bltu2_not_taken;
  logic bgeu1_taken, bgeu2_taken, bgeu_not_taken, bgeu1_not_taken, bgeu2_not_taken;

  // for case splitting
  logic sub_inst, or_inst, addi_inst, beq_inst, jal_inst, jalr_inst;
  logic bne_inst, blt_inst, bge_inst, bltu_inst, bgeu_inst;
  logic branch_supported;
  
  assign rs1_data = dut_regs_gbox[rs1];
  assign rs2_data = dut_regs_gbox[rs2];
  assign rd_data = dut_regs_gbox[rd];

  always_ff @(posedge clk_i) begin
    if(!rstn_i) begin
        tb_pc <= '0;
        chosen_reg_data <= '0;
        chosen_reg_flag <= 1'b0;
    end
    else begin
      if(pc_we_gbox && inst_supported)
        tb_pc <= tb_pc_next;
      // else begin
      //   tb_pc <= '0;
      // end

      // IMPORTANT Chosen reg value is updated only when DUT regs are updated
      if(regs_we_gbox) begin
        chosen_reg_data <= chosen_reg_data_next;
        // chosen_reg_flag <= chosen_reg_flag_next; BUG
        chosen_reg_flag <= chosen_reg_flag_next;
      end

      // Only supported instruction can update chosen reg
      // This event is registered here
      // We check only the case when the chosen reg value is known 
      // IMPORTANT Chosen reg flag should always be updated because unsupported instructions
        // will deassert this reg, and we must keep track of that 
        // We want to avoid checking when the flag is low - False negative

      // Register link address only at the beginning of the JALR inst
      if(jalr_edge2)
        pc_jalr <= rs1_data + imm32;
    end
  end

  always @(*) begin
    inst_supported = 0;
    imm12 = '0;
    imm32 = '0;
    // This will ensure that no in between unsupported instrucion will create a difference between rtl and ref model
    chosen_reg_flag_next = '0;

    rd  = dut_inst_gbox[11:7];
    rs1 = dut_inst_gbox[19:15];
    rs2 = dut_inst_gbox[24:20];

    chosen_reg_data_next = '0;

    tb_pc_next = tb_pc;

    sub_inst = 1'b0; 
    or_inst = 1'b0; 
    addi_inst = 1'b0; 
    beq_inst = 1'b0; 
    jal_inst = 1'b0; 
    jalr_inst = 1'b0;

    branch_supported = 1'b0;
    bne_inst = 1'b0; 
    blt_inst = 1'b0; 
    bge_inst = 1'b0; 
    bltu_inst = 1'b0; 
    bgeu_inst = 1'b0;

    beq1_taken = 1'b0;
    beq2_taken = 1'b0;
    beq_not_taken = 1'b0;
    beq1_not_taken = 1'b0;
    beq2_not_taken = 1'b0;

    bne1_taken = 1'b0;
    bne2_taken = 1'b0;
    bne_not_taken = 1'b0;
    bne1_not_taken = 1'b0;
    bne2_not_taken = 1'b0;

    blt1_taken = 1'b0;
    blt2_taken = 1'b0;
    blt_not_taken = 1'b0;
    blt1_not_taken = 1'b0;
    blt2_not_taken = 1'b0;

    bge1_taken = 1'b0;
    bge2_taken = 1'b0;
    bge_not_taken = 1'b0;
    bge1_not_taken = 1'b0;
    bge2_not_taken = 1'b0;

    bltu1_taken = 1'b0;
    bltu2_taken = 1'b0;
    bltu_not_taken = 1'b0;
    bltu1_not_taken = 1'b0;
    bltu2_not_taken = 1'b0;

    bgeu1_taken = 1'b0;
    bgeu2_taken = 1'b0;
    bgeu_not_taken = 1'b0;
    bgeu1_not_taken = 1'b0;
    bgeu2_not_taken = 1'b0;

    signed_imm32 = 1'b0;
    unsigned_imm32 = 1'b0;

    // Decode Instruction
    case (opcode_gbox)
      //////////////////////////////////////////////////////////////////////////////// 
      // R-TYPE
      //////////////////////////////////////////////////////////////////////////////// 
      OPCODE_ALUR: begin
        if(funct3 == ADD_SUB) begin
          if(funct7 == SUB) begin

            // If chosen reg is the destination, update and keep track
            if(rd == chosen_reg_ndc) begin
              // reg0 cannot be written to
              if(chosen_reg_ndc != '0)
                chosen_reg_data_next = rs1_data - rs2_data;  
              else
                chosen_reg_data_next = '0;  

              chosen_reg_flag_next = 1'b1;

              sub_inst = 1'b1;
              inst_supported = SUB_SWITCH;


              pc_inc();
            end
          end
        end

        else if(funct3 == OR_funct3) begin
          if(funct7 == OR_funct7) begin

            // If chosen reg is the destination, update and keep track
            if(rd == chosen_reg_ndc) begin
              // reg0 cannot be written to
              if(chosen_reg_ndc != '0)
                chosen_reg_data_next = rs1_data | rs2_data;  
              else
                chosen_reg_data_next = '0;  

              chosen_reg_flag_next = 1'b1;

              or_inst = 1'b1;
              inst_supported = OR_SWITCH;
              pc_inc();
            end
          end
        end
      end
      //////////////////////////////////////////////////////////////////////////////// 
      // I-TYPE
      //////////////////////////////////////////////////////////////////////////////// 
      OPCODE_ALUI: begin
        if(funct3 == ADDI) begin
          imm12 = dut_inst_gbox[31:20];
          imm32 = {{20{imm12[11]}}, imm12};

          // If chosen reg is the destination, update and keep track
          if(rd == chosen_reg_ndc) begin
            // reg0 cannot be written to
            if(chosen_reg_ndc != '0)
              chosen_reg_data_next = imm32 + rs1_data;  
            else
              chosen_reg_data_next = '0;  

            chosen_reg_flag_next = 1'b1;

            addi_inst = 1'b1;
            inst_supported = ADDI_SWITCH;
            pc_inc();
          end
        end
      end
      //////////////////////////////////////////////////////////////////////////////// 
      // B-TYPE
      //////////////////////////////////////////////////////////////////////////////// 
      OPCODE_BRANCH: begin
        // Common for every branch type
        imm32 = {{20{dut_inst_gbox[31]}},      // IMM[31:12]
                dut_inst_gbox[7],             // IMM[11]
                dut_inst_gbox[30:25],        // IMM[10:5]
                dut_inst_gbox[11:8],        // IMM[4:1]
                1'b0                       // IMM[0]
                };
        if(imm32[31])
          signed_imm32 = 1'b1;
        else
          unsigned_imm32 = 1'b1;

        // Branch can not affect registers, only PC // If there was previously only ADDI then here we should just keep the previous value 
        chosen_reg_flag_next = chosen_reg_flag;
        chosen_reg_data_next = chosen_reg_data;


        ////////////////////////////////////////////////////////////////////////////////
        // BEQ
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BEQ) begin
          beq_inst = 1'b1;
          branch_supported = 1'b1;

          if(rs1 == chosen_reg_ndc) begin
            inst_supported = BEQ_SWITCH;
            if(chosen_reg_data == rs2_data) begin
              beq1_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin
              beq_not_taken = 1'b1;
              beq1_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end

          else if(rs2 == chosen_reg_ndc) begin
            inst_supported = BEQ_SWITCH;
            if(rs1_data == chosen_reg_data) begin
              beq2_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin 
              beq_not_taken = 1'b1;
              beq2_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end
        end

        ////////////////////////////////////////////////////////////////////////////////
        // BNE
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BNE) begin
          bne_inst = 1'b1;
          branch_supported = 1'b1;

          if(rs1 == chosen_reg_ndc) begin
            inst_supported = BNE_SWITCH;
            if(chosen_reg_data != rs2_data) begin
              bne1_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin
              bne_not_taken = 1'b1;
              bne1_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end

          else if(rs2 == chosen_reg_ndc) begin
            inst_supported = BNE_SWITCH;
            if(rs1_data != chosen_reg_data) begin
              bne2_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin 
              bne_not_taken = 1'b1;
              bne2_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end
        end
        ////////////////////////////////////////////////////////////////////////////////
        // BLT
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BLT) begin
          blt_inst = 1'b1;

          if(rs1 == chosen_reg_ndc) begin
            inst_supported = BLT_SWITCH;
            if($signed(chosen_reg_data) < $signed(rs2_data)) begin
              blt1_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin
              blt_not_taken = 1'b1;
              blt1_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end

          else if(rs2 == chosen_reg_ndc) begin
            inst_supported = BLT_SWITCH;
            if($signed(rs1_data) < $signed(chosen_reg_data)) begin
              blt2_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin 
              blt_not_taken = 1'b1;
              blt2_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end
        end
        ////////////////////////////////////////////////////////////////////////////////
        // BGE
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BGE) begin
          bge_inst = 1'b1;

          if(rs1 == chosen_reg_ndc) begin
            inst_supported = BGE_SWITCH;
            if($signed(chosen_reg_data) >= $signed(rs2_data)) begin
              bge1_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin
              bge_not_taken = 1'b1;
              bge1_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end

          else if(rs2 == chosen_reg_ndc) begin
            inst_supported = BGE_SWITCH;
            if($signed(rs1_data) >= $signed(chosen_reg_data)) begin
              bge2_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin 
              bge_not_taken = 1'b1;
              bge2_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end
        end

        ////////////////////////////////////////////////////////////////////////////////
        // BLTU
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BLTU) begin
          bltu_inst = 1'b1;

          if(rs1 == chosen_reg_ndc) begin
            inst_supported = BLTU_SWITCH;
            if(chosen_reg_data < rs2_data) begin
              bltu1_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin
              bltu_not_taken = 1'b1;
              bltu1_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end

          else if(rs2 == chosen_reg_ndc) begin
            inst_supported = BLTU_SWITCH;
            if(rs1_data < chosen_reg_data) begin
              bltu2_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin 
              bltu_not_taken = 1'b1;
              bltu2_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end
        end

        ////////////////////////////////////////////////////////////////////////////////
        // BGEU
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BGEU) begin
          bgeu_inst = 1'b1;

          if(rs1 == chosen_reg_ndc) begin
            inst_supported = BGEU_SWITCH;
            if(chosen_reg_data >= rs2_data) begin
              bgeu1_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin
              bgeu_not_taken = 1'b1;
              bgeu1_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end

          else if(rs2 == chosen_reg_ndc) begin
            inst_supported = BGEU_SWITCH;
            if(rs1_data >= chosen_reg_data) begin
              bgeu2_taken = 1'b1;
              tb_pc_next = dut_pc_gbox + imm32;
            end
            else begin 
              bgeu_not_taken = 1'b1;
              bgeu2_not_taken = 1'b1;
              // pc_inc();
              tb_pc_next = dut_pc_gbox + 4;
            end
          end
        end
      end
      //////////////////////////////////////////////////////////////////////////////// 
      // J-TYPE
      //////////////////////////////////////////////////////////////////////////////// 
      OPCODE_JAL: begin
        imm32 = {{11{dut_inst_gbox[31]}}, // sign extension
                dut_inst_gbox[31],       // IMM[20]
                dut_inst_gbox[19:12],    // IMM[19:12]
                dut_inst_gbox[20],       // IMM[11]
                dut_inst_gbox[30:21],    // IMM[10:1]
                1'b0                    // IMM[0]
                };

        // If destination is chosen reg, save the returning address 
        if(rd == chosen_reg_ndc) begin
          if(chosen_reg_ndc != '0)
            chosen_reg_data_next = dut_pc_gbox + 4;
          else
            chosen_reg_data_next = '0;

          chosen_reg_flag_next = 1'b1;
        end

        next_pc_assign(dut_pc_gbox + imm32);

        jal_inst = 1'b1;
        inst_supported = JAL_SWITCH;
      end
      OPCODE_JALR: begin
        imm32 = {{20{dut_inst_gbox[31]}},dut_inst_gbox[31:20]};
        
        if(rd == chosen_reg_ndc) begin
          if(chosen_reg_ndc != '0)
            chosen_reg_data_next = dut_pc_gbox + 4;
          else
            chosen_reg_data_next = '0;
          chosen_reg_flag_next = 1'b1;
        end

        // zero out LSB bit
        // Aligned to even address for instruction
        next_pc_assign(pc_jalr & 32'hFFFF_FFFE);
        jalr_inst = 1'b1;
        inst_supported = JALR_SWITCH;

      end
    endcase
  end

  ////////////////////////////////////////////////////////////////////////////////
  // MAIN CHECK
  ////////////////////////////////////////////////////////////////////////////////

  // cov_addi_inst: cover property(opcode_gbox == OPCODE_ALUI && funct3 == 3'b000 && neorv32_cpu_regfile_inst.reg_file[1] == 7);
  // cov_addi_inst2: cover property(opcode_gbox == OPCODE_ALUI && funct3 == ADDI && rs1_data == 7);

  // ast_addi_inst: assert property(opcode_gbox == OPCODE_ALUI && inst_supported && neorv32_cpu_control_inst.ctrl_nxt.rf_wb_en
  //                                |=>  neorv32_cpu_regfile_inst.reg_file[rd] == chosen_reg_data);

  // CHECK PC
  ast_pc_main:                          assert property(!exception && pc_we_gbox && inst_supported && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // Check one cycle earlier
  ast_next_pc_main:                     assert property(!exception && pc_we_gbox && inst_supported && chosen_reg_flag |-> tb_pc_next == dut_next_pc_gbox);
  // ast_pc_main_check:                    assert property(pc_we_gbox && inst_supported && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // CHECK CHOSEN REG
  ast_chosen_reg:                       assert property(!exception && regs_we_gbox && inst_supported && chosen_reg_flag && (rd == chosen_reg_ndc) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);

  cov_beq_check_sanity:                 cover property((pc_we_gbox && inst_supported && !trap_event && chosen_reg_flag) && (opcode_gbox == OPCODE_BRANCH));
  
  ////////////////////////////////////////////////////////////////////////////////
  // CASE SPLIT
  ////////////////////////////////////////////////////////////////////////////////
  // 0f:l40i <Esc>020l040ldwj
  // // INSTRUCTIONS per instr
  // ast_pc_main_SUB_check:                assert property(!exception && pc_we_gbox && (inst_supported && sub_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // ast_pc_main_OR_check:                 assert property(!exception && pc_we_gbox && (inst_supported && or_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // ast_pc_main_ADDI_check:               assert property(!exception && pc_we_gbox && (inst_supported && addi_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  ast_pc_main_BEQ:                      assert property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);

  //Check one cycle earlier

  ///////////////
  // TARGET
  ///////////////
  ast_next_pc_main_BEQ:          assert property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag |-> tb_pc_next == dut_next_pc_gbox);
  ast_next_pc_main_BEQ_BNE_TARGET:          assert property(!exception && pc_we_gbox && (inst_supported && branch_supported) && chosen_reg_flag |-> tb_pc_next == dut_next_pc_gbox);



  property next_pc_BEQ_taken1_signed;
    !exception && 
    pc_we_gbox && 
    (inst_supported && beq_inst) && 
    beq1_taken && 
    signed_imm32 && 
    chosen_reg_flag 
    |-> 
    tb_pc_next == dut_next_pc_gbox;
  endproperty
  ast_next_pc_BEQ_taken1_signed:        assert property(next_pc_BEQ_taken1_signed);

  // Overconstrain value
  property next_pc_BEQ_taken1_unsigned;
    !exception && 
    pc_we_gbox && 
    (inst_supported && beq_inst) && 
    // beq1_taken && 
    // unsigned_imm32 && 
    // Overconstrain value
    // imm32 == 12 && 
    chosen_reg_flag 
    |-> 
    tb_pc_next == dut_next_pc_gbox;
  endproperty
  ast_next_pc_BEQ_taken1_unsigned:      assert property(next_pc_BEQ_taken1_unsigned);

  // cov_BEQ:                              cover property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && branch_taken);

  cov_BEQ1:                             cover property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && beq1_taken);
  cov_BEQ2:                             cover property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && beq2_taken);
  cov_no_BEQ:                           cover property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && beq_not_taken);

  // ast_pc_main_JAL_check:                assert property(!exception && pc_we_gbox && (inst_supported && jal_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // ast_pc_main_JALR_check:               assert property(!exception && pc_we_gbox && (inst_supported && jalr_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);

  // // REGS per regs and per instr
  // genvar k;
  // generate
  //   for(k=0; k<32; k++) begin
  //     ast_chosen_reg_SUB_check:         assert property(!exception && regs_we_gbox && (inst_supported && sub_inst) && chosen_reg_flag && (rd == chosen_reg_ndc) && (chosen_reg_ndc == k) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);
  //     ast_chosen_reg_OR_check:          assert property(!exception && regs_we_gbox && (inst_supported && or_inst) && chosen_reg_flag && (rd == chosen_reg_ndc) && (chosen_reg_ndc == k) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);
  //     ast_chosen_reg_ADDI_check:        assert property(!exception && regs_we_gbox && (inst_supported && addi_inst) && chosen_reg_flag && (rd == chosen_reg_ndc) && (chosen_reg_ndc == k) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);
  //     // ast_chosen_reg_BEQ_check:         assert property(!exception && regs_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && (rd == chosen_reg_ndc) && (chosen_reg_ndc == k) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);
  //     ast_chosen_reg_JAL_check:         assert property(!exception && regs_we_gbox && (inst_supported && jal_inst) && chosen_reg_flag && (rd == chosen_reg_ndc) && (chosen_reg_ndc == k) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);
  //     ast_chosen_reg_JALR_check:        assert property(!exception && regs_we_gbox && (inst_supported && jalr_inst) && chosen_reg_flag && (rd == chosen_reg_ndc) && (chosen_reg_ndc == k) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);
  //   end
  // endgenerate

  // genvar j;
  // generate
  //   for(j=0; j<32; j++) begin
  //     ast_pc_main_BEQ_reg_check:        assert property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_ndc == j && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  //   end
  // endgenerate

////////////////////////////////////////////////////////////////////////////////
// SST HELPERS for pc main BEQ check with CASE SPLIT (signed imm32 and chosen_reg_ndc == rs1)
////////////////////////////////////////////////////////////////////////////////
// VIM GENERATE HELPER: 0w"tywiproperty <Esc>A;<Esc>oendpro<Esc>O\<BS>|-><Esc>Ocond<BS><BS><BS><BS>precodn<BS><BS>nd<Esc>joassert<Esc>joast_<Esc>"tpa_HELP_HIGH_NEW: <Esc>aassert property(<Esc>"tp<Esc>A;<Esc>o<Esc>
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PC VALUE HELPERS
////////////////////////////////////////////////////////////////////////////////

property pc_BEQ_no_branch;
  !exception && 
  pc_we_gbox && 
  (inst_supported && beq_inst) && 
  chosen_reg_flag && 
  !branch_taken 
  |-> 
  dut_next_pc_gbox == (dut_pc_gbox + 4);
endproperty
// PROVEN - HARD TO PROVE IN LAST ITERATION
// REMOVE?
ast_pc_BEQ_no_branch_HELP:       assert property(pc_BEQ_no_branch);

////////////////////////////////////////////////////////////////////////////////
// BEQ NOT TAKEN
////////////////////////////////////////////////////////////////////////////////
property pc_DUT_BEQ_no_branch_mult_states;
  !exception && 
  (exec_state_gbox == DISPATCH || exec_state_gbox == BRANCH) && 
  (inst_supported && beq_inst) && 
  chosen_reg_flag && 
  beq_not_taken
  |-> 
  dut_next_pc_gbox == (dut_pc_gbox + 4);
endproperty
ast_pc_DUT_BEQ_no_branch_mult_states_HELP_HIGH_NEW:       assert property(pc_DUT_BEQ_no_branch_mult_states);

// *** FAILS ***
// property pc_TB_BEQ_no_branch_mult_states;
//   !exception && 
//   (exec_state_gbox == DISPATCH || exec_state_gbox == BRANCH) && 
//   (inst_supported && beq_inst) && 
//   chosen_reg_flag && 
//   beq_not_taken
//   |-> 
//   tb_pc_next == (tb_pc + 4);
// endproperty
// ast_pc_TB_BEQ_no_branch_mult_states_HELP_HIGH_NEW:       assert property(pc_TB_BEQ_no_branch_mult_states);

////////////////////////////////////////////////////////////////////////////////
// BEQ TAKEN
////////////////////////////////////////////////////////////////////////////////
property next_pc1_TB_beq;
(beq1_taken || beq2_taken)
&& ((exec_state_gbox == BRANCH) || (exec_state_gbox == BRANCHED))
|->
tb_pc_next == dut_pc_gbox + imm32;
endproperty
// PROVEN
ast_next_pc1_TB_beq_HELP_HIGH: assert property(next_pc1_TB_beq);

property next_pc2_tb_beq;
(beq1_taken || beq2_taken)
&& (exec_state_gbox == DISPATCH)
|->
tb_pc_next == dut_pc_gbox + imm32;
endproperty
// PROVEN
ast_next_pc2_TB_beq_HELP_HIGH: assert property(next_pc2_tb_beq);

property next_pc1_dut_beq;
(beq1_taken || beq2_taken)
&& (exec_state_gbox == BRANCHED)
&& !exception
&& chosen_reg_flag
|->
dut_next_pc_gbox == dut_pc_gbox + imm32;
endproperty
// PROVEN
ast_next_pc1_DUT_beq_HELP_HIGH: assert property(next_pc1_dut_beq);

////////////////////////////////////////////////////////////////////////////////
// *** CRITICAL PROPERTY - PROVEN WITH HELPERS ***
////////////////////////////////////////////////////////////////////////////////
// multiple states as precondition (dispatch phase)
property next_pc2_dut_mstate_beq;
(beq1_taken || beq2_taken)
&& (exec_state_gbox == DISPATCH)
&& !exception
&& chosen_reg_flag
|->
dut_next_pc_gbox == dut_pc_gbox + imm32;
endproperty
//This won't work if interrupts are allowed because afer DISPATCH
// system will enter TRAP state and there will be no branch 
// PROBLEM: DISPATCH happens BEFORE trap event
// ast_next_pc2_DUT_beq_HELP_HIGH: assert property(next_pc2_dut_mstate_beq);
// ast_next_pc2_DUT_beq_TARGET: assert property(next_pc2_dut_beq);

// single state as precondtion (pc_we last for one cycle)
property next_pc2_dut_sstate_beq;
(beq1_taken || beq2_taken)
&& pc_we_gbox  
&& !exception
&& chosen_reg_flag
|->
dut_next_pc_gbox == dut_pc_gbox + imm32;
endproperty
// If precondition is only pc_we, then TRAP event already happend and this case won't be considered
// SOLUTION: pc_we happens AFTER trap event
ast_next_pc2_DUT_sstate_beq_HELP_HIGH: assert property(next_pc2_dut_sstate_beq);

////////////////////////////////////////////////////////////////////////////////
// Instr fields HELPERS
////////////////////////////////////////////////////////////////////////////////

property next_ir_opcode_value;
    next_ir_gbox[6:0] == '0 || 
    next_ir_gbox[6:0] == OPCODE_ALUR || 
    next_ir_gbox[6:0] == OPCODE_ALUR || 
    next_ir_gbox[6:0] == OPCODE_ALUI || 
    next_ir_gbox[6:0] == OPCODE_JAL || 
    next_ir_gbox[6:0] == OPCODE_JALR || 
    next_ir_gbox[6:0] == OPCODE_BRANCH;
endproperty
// PROVEN -> FAILS WHEN CONSTRAINTS WERE REMOVED
// CEX: load instruction can happen
// ast_next_ir_opcode_value_HELP_HIGH:   assert property(next_ir_opcode_value);

////////////////////////////////////////////////////////////////////////////////
// STATE HELPERS
////////////////////////////////////////////////////////////////////////////////

property exec_state1;
  !exception && 
  exec_state_gbox != TRAP_ENTER && 
  beq_inst 
  |->
  exec_state_gbox inside {DISPATCH, EXECUTE, BRANCH, BRANCHED};
endproperty
// PROVEN
ast_exec_state1_HELP_HIGH:         assert property(exec_state1);

property exec_state2;
beq_inst
&& !exception
&& (($changed(exec_state_gbox) && exec_state_gbox == BRANCHED) 
// || ($changed(exec_state_gbox) && exec_state_gbox == DISPATCH)
)
|->
$past(exec_state_gbox == BRANCH);
endproperty

// PROVEN
ast_exec_state2_HELP_HIGH: assert property(exec_state2);


////////////////////////////////////////////////////////////////////////////////
// NDC DATA HELPERS - BEQ TAKEN
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// If branch is taken, lets say beq2, that means upon $rose(beq2_taken) -> EXECUTE PHASE
////////////////////////////////////////////////////////////////////////////////

  // PROVEN
ast_beq2_state_HELP_HIGH:         assert property(!exception && $rose(beq2_taken) |-> exec_state_gbox == EXECUTE);
ast_beq1_state_HELP_HIGH:         assert property(!exception && $rose(beq1_taken) |-> exec_state_gbox == EXECUTE);

////////////////////////////////////////////////////////////////////////////////
// If beq2 -> chosen_reg_ndc == rs2 && chosen_reg_data == rs2_data
// If beq -> BRANCH IS TAKEN
////////////////////////////////////////////////////////////////////////////////

// PROVEN
ast_beq2a_ndc_data_HELP_HIGH:      assert property(!exception && $rose(beq2_taken) |-> chosen_reg_data == rs1_data);
// *HARD TO PROVE* -> PROVEN
ast_beq2b_ndc_data_HELP_HIGH:      assert property(!exception && chosen_reg_flag && $rose(beq2_taken) |-> chosen_reg_data == rs2_data);
// *HARD TO PROVE* -> PROVEN
ast_beq2c_ndc_data_HELP_HIGH:      assert property(!exception && chosen_reg_flag && (beq2_taken) |-> chosen_reg_data == rs2_data);

ast_beq1a_ndc_data_HELP_HIGH:      assert property(!exception && $rose(beq1_taken) |-> chosen_reg_data == rs2_data);
// *HARD TO PROVE* -> PROVEN
ast_beq1b_ndc_data_HELP_HIGH:      assert property(!exception && chosen_reg_flag && $rose(beq1_taken) |-> chosen_reg_data == rs1_data);
// *HARD TO PROVE* -> PROVEN
ast_beq1c_ndc_data_HELP_HIGH:      assert property(!exception && chosen_reg_flag && (beq1_taken) |-> chosen_reg_data == rs1_data);

// *HARD TO PROVE* -> PROVEN
ast_ndc_reg_HELP_HIGH: assert property(!exception && (rd == chosen_reg_ndc) && inst_supported && chosen_reg_flag |-> dut_regs_gbox[rd] == chosen_reg_data);
////////////////////////////////////////////////////////////////////////////////
// NDC DATA HELPERS - BEQ NOT TAKEN
////////////////////////////////////////////////////////////////////////////////

// *HARD TO PROVE* -> PROVEN
ast_no_beq_rs_data_HELP_HIGH:      assert property(!exception && chosen_reg_flag && beq_not_taken |-> rs1_data != rs2_data);
ast_no_beq1_ndc_data_HELP_HIGH_NEW:      assert property(!exception && chosen_reg_flag && beq1_not_taken |-> rs1_data == chosen_reg_data);
ast_no_beq2_ndc_data_HELP_HIGH_NEW:      assert property(!exception && chosen_reg_flag && beq2_not_taken |-> rs2_data == chosen_reg_data);

////////////////////////////////////////////////////////////////////////////////
// AUX CHECK - CHECK SANITY
////////////////////////////////////////////////////////////////////////////////

// Chosen flag can only be asserted for supported instructions
ast_aux_chosen_flag:                  assert property(chosen_reg_flag_next |-> opcode_gbox == OPCODE_ALUI || opcode_gbox == OPCODE_BRANCH);

////////////////////////////////////////////////////////////////////////////////
// CONSTRAINTS
////////////////////////////////////////////////////////////////////////////////

// input msi_i,
// input mei_i,
// input mti_i,
// input[15:0] firq_i,
// input dbi_i,
// input[73:0] dbus_req_o,
// input[33:0] dbus_rsp_i

logic[19:0] interrupts;
assign interrupts = {msi_i, mei_i, mti_i, firq_i, dbi_i};

logic[31:0] inst_top;
assign inst_top = ibus_rsp_i[33:2];

logic[6:0] opcode_top;
logic[2:0] funct3_top;
logic[6:0] funct7_top;
logic[4:0] rd_top;
logic[4:0] rs1_top;
logic[4:0] rs2_top;
logic[11:0] imm_beq_top;
assign opcode_top = inst_top[6:0];
assign funct7_top = inst_top[31:25];
assign funct3_top = inst_top[14:12];
assign rd_top  = inst_top[11:7];
assign rs1_top = inst_top[19:15];
assign rs2_top = inst_top[24:20];

assign imm_beq_top = {inst_top[31],      // IMM[12]
                      inst_top[7],       // IMM[11]
                      inst_top[30:25],   // IMM[10:5]
                      inst_top[11:8],    // IMM[4:1]
                      1'b0               // IMM[0]
                      };

logic inst_supported_top;
/*
How to assure that instruction is supported?
  1. Supported opcode
  2. Supported function fields
  3. For insts that modifie regs, RD must be equal with NDC
*/
assign inst_supported_top = 
                            // allowed function fields for R-type instructions
                            (
                              (opcode_top == OPCODE_ALUR) 
                              && ((funct3_top == ADD_SUB) || (funct3_top == OR_funct3)) 
                              && ((funct7_top == SUB) || (funct7_top == OR_funct7))
                              // Additional condition that will assure instruction supportness
                              // && (rd_top == chosen_reg_ndc)
                            ) ||

                            // allowed function fields for I-type instructions
                            (
                              (opcode_top == OPCODE_ALUI) 
                              && (funct3_top == ADDI) 
                              // Additional condition that will assure instruction supportness
                              // && (rd_top == chosen_reg_ndc)
                            ) ||

                            (opcode_top == OPCODE_JAL) ||
                            (opcode_top == OPCODE_JALR) ||

                            // allowed function fields for B-type instructions
                            (
                              (opcode_top == OPCODE_BRANCH) 
                              && (funct3_top == ADDI)
                              // Additional branch constraints
                              && (imm_beq_top < 10)
                            );

// logic[4:0] rs1_top, rs2_top, rd_top;
// assign rd_data_top = inst_top[11:7];
// assign rs1_data_top = inst_top[19:15];
// assign rs2_data_top = inst_top[24:20];


// Disable interrupts
// asm_no_irqs: assume property(interrupts == '0);
// Allow only supported instructions
// asm_only_supp_inst: assume property(inst_supported_top);
// Overconstrain imm32 value 
// asm_imm32: assume property(opcode_top == BRANCH |-> imm_beq_top == 12);
/*
How it is possible that opcode_gbox has different value in comparison to opcode_top?
Inspect ipb buffer?
How instruction in execute fase in retreived?
Inst top -> execute.ir ???

*/
endmodule
