
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

  localparam XLEN = 32;
  logic[31:0] tb_pc, tb_pc_next;
  logic[31:0] dut_pc_gbox;
  logic[6:0] opcode_gbox;

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
  logic sub_inst, or_inst, addi_inst, beq_inst, jal_inst;
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

        // If chosen reg flag is not set, that means that no supported instruction has updated it, hence its value is unknown
        // In that case no decision about branch could be made by reference model


        ////////////////////////////////////////////////////////////////////////////////
        // BEQ -> PROVEN 
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BEQ) begin
          beq_inst = 1'b1;
          // Checked in target property
          branch_supported = 1'b1;
          if(chosen_reg_flag) begin 
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
        end

        ////////////////////////////////////////////////////////////////////////////////
        // BNE
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BNE) begin
          bne_inst = 1'b1;
          // Checked in target property
          branch_supported = 1'b1;

          if(chosen_reg_flag) begin 
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
        end
        ////////////////////////////////////////////////////////////////////////////////
        // BLT
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BLT) begin
          blt_inst = 1'b1;
          // Checked in target property
          branch_supported = 1'b1;

          if(chosen_reg_flag) begin 
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
        end
        ////////////////////////////////////////////////////////////////////////////////
        // BGE
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BGE) begin
          bge_inst = 1'b1;
          // Checked in target property
          branch_supported = 1'b1;

          if(chosen_reg_flag) begin 
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
        end

        ////////////////////////////////////////////////////////////////////////////////
        // BLTU
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BLTU) begin
          bltu_inst = 1'b1;
          // Checked in target property
          branch_supported = 1'b1;

          if(chosen_reg_flag) begin 
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
        end

        ////////////////////////////////////////////////////////////////////////////////
        // BGEU
        ////////////////////////////////////////////////////////////////////////////////
        if(funct3 == BGEU) begin
          bgeu_inst = 1'b1;
          // Checked in target property
          branch_supported = 1'b1;

          if(chosen_reg_flag) begin 
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

  // CHECK PC
  ast_pc_main:                          assert property(!exception && pc_we_gbox && inst_supported && chosen_reg_flag |=> tb_pc == dut_pc_gbox);

  // Check one cycle earlier -> MORE EFFICIENT for formal tool
  ast_next_pc_main:                     assert property(!exception && pc_we_gbox && inst_supported && chosen_reg_flag |-> tb_pc_next == dut_next_pc_gbox);

  // CHECK CHOSEN REG
  ast_chosen_reg:                       assert property(!exception && regs_we_gbox && inst_supported && chosen_reg_flag && (rd == chosen_reg_ndc) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);

  cov_beq_check_sanity:                 cover property((pc_we_gbox && inst_supported && !trap_event && chosen_reg_flag) && (opcode_gbox == OPCODE_BRANCH));
  
  ////////////////////////////////////////////////////////////////////////////////
  // CASE SPLIT of the target property. Focus only on branch instructions as they are hard to prove.
  ////////////////////////////////////////////////////////////////////////////////
  // 0f:l40i <Esc>020l040ldwj
  // // INSTRUCTIONS per instr
  // ast_pc_main_SUB_check:                assert property(!exception && pc_we_gbox && (inst_supported && sub_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // ast_pc_main_OR_check:                 assert property(!exception && pc_we_gbox && (inst_supported && or_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // ast_pc_main_ADDI_check:               assert property(!exception && pc_we_gbox && (inst_supported && addi_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  ast_pc_main_BEQ:                      assert property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);

  //Check one cycle earlier
  ast_next_pc_main_BEQ:                 assert property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag |-> tb_pc_next == dut_next_pc_gbox);
  ///////////////
  // TARGET
  ///////////////
  ast_next_pc_main_BRANCH_TARGET:      assert property(!exception && pc_we_gbox && (inst_supported && branch_supported) && chosen_reg_flag |-> tb_pc_next == dut_next_pc_gbox);

  cov_BEQ1:                             cover property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && beq1_taken);
  cov_BEQ2:                             cover property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && beq2_taken);
  cov_no_BEQ:                           cover property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && beq_not_taken);

////////////////////////////////////////////////////////////////////////////////
// SST HELPERS 
////////////////////////////////////////////////////////////////////////////////

// Proof structure:
/*
  Main Target
    Main helpers
      Lv1 helpers
        Lv2 helpers
*/
  ////////////////////////////////////////////////////////////////////////////////
  // Main Helper: BEQ NOT TAKEN
  ////////////////////////////////////////////////////////////////////////////////
  
  // SUBTARGET
  // MAIN TOP HELPER - STANDARD INCREMENT
  property next_pc_increment(branch_not_taken);
    !exception && 
    (exec_state_gbox == DISPATCH || exec_state_gbox == BRANCH) && 
    // (inst_supported && beq_inst) && 
    chosen_reg_flag && 
    branch_not_taken
    |-> 
    dut_next_pc_gbox == (dut_pc_gbox + 4);
  endproperty
  ast_next_pc_increment_BEQ_MAIN_HELP_HIGH:       assert property(next_pc_increment(beq_not_taken));
  ast_next_pc_increment_BNE_MAIN_HELP_HIGH:       assert property(next_pc_increment(bne_not_taken));
  ast_next_pc_increment_BLT_MAIN_HELP_HIGH:       assert property(next_pc_increment(blt_not_taken));
  ast_next_pc_increment_BGE_MAIN_HELP_HIGH:       assert property(next_pc_increment(bge_not_taken));
  ast_next_pc_increment_BLTU_MAIN_HELP_HIGH:       assert property(next_pc_increment(bltu_not_taken));
  ast_next_pc_increment_BGEU_MAIN_HELP_HIGH:       assert property(next_pc_increment(bgeu_not_taken));

  ////////////////////////////////////////////////////////////////////////////////
  // Main Helper: BEQ TAKEN
  ////////////////////////////////////////////////////////////////////////////////

  // single state as precondtion (pc_we last for one cycle)

  // SUBTARGET
  // MAIN TOP HELPER - BRANCH
  property next_pc_branch(branch1_taken, branch2_taken);
    (branch1_taken || branch2_taken)
    && pc_we_gbox  
    && !exception
    && chosen_reg_flag
    |->
    dut_next_pc_gbox == dut_pc_gbox + imm32;
  endproperty

  ast_next_pc_branch_BEQ_MAIN_HELP_HIGH: assert property(next_pc_branch(beq1_taken, beq2_taken));
  ast_next_pc_branch_BNE_MAIN_HELP_HIGH: assert property(next_pc_branch(bne1_taken, bne2_taken));
  ast_next_pc_branch_BLT_MAIN_HELP_HIGH: assert property(next_pc_branch(blt1_taken, blt2_taken));
  ast_next_pc_branch_BLTU_MAIN_HELP_HIGH: assert property(next_pc_branch(bltu1_taken, bltu2_taken));
  ast_next_pc_branch_BGE_MAIN_HELP_HIGH: assert property(next_pc_branch(bge1_taken, bge2_taken));
  ast_next_pc_branch_BGEU_MAIN_HELP_HIGH: assert property(next_pc_branch(bgeu1_taken, bgeu2_taken));

  ////////////////////////////////////////////////////////////////////////////////
  // LV1 HELPERS - TARGETs are main helpers
    property next_pc_branch_BRANCHED(branch1_taken, branch2_taken);
    (branch1_taken || branch2_taken)
    && (exec_state_gbox == BRANCHED)
    && !exception
    && chosen_reg_flag
    |->
    dut_next_pc_gbox == dut_pc_gbox + imm32;
    endproperty
    ast_next_pc_branch_BRANCHED_BEQ_LV1_HELP_HIGH:       assert property(next_pc_branch_BRANCHED(beq1_taken, beq2_taken));
    ast_next_pc_branch_BRANCHED_BNE_LV1_HELP_HIGH:       assert property(next_pc_branch_BRANCHED(bne1_taken, bne2_taken));
    ast_next_pc_branch_BRANCHED_BLT_LV1_HELP_HIGH:       assert property(next_pc_branch_BRANCHED(blt1_taken, blt2_taken));
    ast_next_pc_branch_BRANCHED_BLTU_LV1_HELP_HIGH:       assert property(next_pc_branch_BRANCHED(bltu1_taken, bltu2_taken));
    ast_next_pc_branch_BRANCHED_BGE_LV1_HELP_HIGH:       assert property(next_pc_branch_BRANCHED(bge1_taken, bge2_taken));
    ast_next_pc_branch_BRANCHED_bgeu_LV1_HELP_HIGH:       assert property(next_pc_branch_BRANCHED(bgeu1_taken, bgeu2_taken));
    // ast_next_pc1_DUT_BNE_HELP_HIGH:       assert property(next_pc1_dut_branch(bne1_taken, bne2_taken));
    // ast_next_pc1_DUT_BLT_HELP_HIGH:       assert property(next_pc1_dut_branch(blt1_taken, blt2_taken));
    // ast_next_pc1_DUT_BLTU_HELP_HIGH:       assert property(next_pc1_dut_branch(bltu1_taken, bltu2_taken));
    // ast_next_pc1_DUT_BGE_HELP_HIGH:       assert property(next_pc1_dut_branch(bge1_taken, bge2_taken));
    // ast_next_pc1_DUT_BGEU_HELP_HIGH:       assert property(next_pc1_dut_branch(bgeu1_taken, bgeu2_taken));

    // State helpers
    property exec_state(branch_inst);
      !exception && 
      exec_state_gbox != TRAP_ENTER && 
      branch_inst 
      |->
      exec_state_gbox inside {DISPATCH, EXECUTE, BRANCH, BRANCHED};
    endproperty
    ast_exec_state_BEQ_LV1_HELP_HIGH:         assert property(exec_state(beq_inst));
    ast_exec_state_BNE_LV1_HELP_HIGH:         assert property(exec_state(bne_inst));
    ast_exec_state_BLT_LV1_HELP_HIGH:         assert property(exec_state(blt_inst));
    ast_exec_state_BLTU_LV1_HELP_HIGH:         assert property(exec_state(bltu_inst));
    ast_exec_state_BGE_LV1_HELP_HIGH:         assert property(exec_state(bge_inst));
    ast_exec_state_BGEU_LV1_HELP_HIGH:         assert property(exec_state(bgeu_inst));


    property no_branch_decision (branch1_taken, branch2_taken);
      !exception
      && !branch_taken
      && exec_state_gbox != EXECUTE
      |->
      !(branch1_taken || branch2_taken);
    endproperty
    ast_no_branch_decision_BEQ_LV1_HELP_HIGH: assert property(no_branch_decision(beq1_taken, beq2_taken));
    ast_no_branch_decision_BNE_LV1_HELP_HIGH: assert property(no_branch_decision(bne1_taken, bne2_taken));
    ast_no_branch_decision_BLT_LV1_HELP_HIGH: assert property(no_branch_decision(blt1_taken, blt2_taken));
    ast_no_branch_decision_BLTU_LV1_HELP_HIGH: assert property(no_branch_decision(bltu1_taken, bltu2_taken));
    ast_no_branch_decision_BGE_LV1_HELP_HIGH: assert property(no_branch_decision(bge1_taken, bge2_taken));
    ast_no_branch_decision_BGEU_LV1_HELP_HIGH: assert property(no_branch_decision(bgeu1_taken, bgeu2_taken));



    property branch_decision(branch1_taken, branch2_taken, branch_inst);
      !exception
      && branch_taken
      && branch_inst
      && exec_state_gbox != EXECUTE
      && branch_supported && inst_supported
      |->
      (branch1_taken || branch2_taken);
    endproperty
    ast_branch_decision_BEQ_LV1_HELP_HIGH: assert property(branch_decision(beq1_taken, beq2_taken, beq_inst));
    ast_branch_decision_BNE_LV1_HELP_HIGH: assert property(branch_decision(bne1_taken, bne2_taken, bne_inst));
    ast_branch_decision_BLT_LV1_HELP_HIGH: assert property(branch_decision(blt1_taken, blt2_taken, blt_inst));
    ast_branch_decision_BLTU_LV1_HELP_HIGH: assert property(branch_decision(bltu1_taken, bltu2_taken, bltu_inst));
    ast_branch_decision_BGE_LV1_HELP_HIGH: assert property(branch_decision(bge1_taken, bge2_taken, bge_inst));
    ast_branch_decision_BGEU_LV1_HELP_HIGH: assert property(branch_decision(bgeu1_taken, bgeu2_taken, bgeu_inst));

  ////////////////////////////////////////////////////////////////////////////////
  // Lv 2 helpers
    property no_branch_decision_subhelp (branch_not_taken, branch_inst);
      !exception
      && !branch_taken
      && branch_inst
      && chosen_reg_flag
      && branch_supported && inst_supported
      && exec_state_gbox != EXECUTE
      |->
      branch_not_taken;
    endproperty
    ast_no_branch_decision_subhelp_BEQ_LV2_HELP_HIGH: assert property(no_branch_decision_subhelp(beq_not_taken, beq_inst));
    ast_no_branch_decision_subhelp_BNE_LV2_HELP_HIGH: assert property(no_branch_decision_subhelp(bne_not_taken, bne_inst));
    ast_no_branch_decision_subhelp_BLT_LV2_HELP_HIGH: assert property(no_branch_decision_subhelp(blt_not_taken, blt_inst));
    ast_no_branch_decision_subhelp_BLTU_LV2_HELP_HIGH: assert property(no_branch_decision_subhelp(bltu_not_taken, bltu_inst));
    ast_no_branch_decision_subhelp_BGE_LV2_HELP_HIGH: assert property(no_branch_decision_subhelp(bge_not_taken, bge_inst));
    ast_no_branch_decision_subhelp_BGEU_LV2_HELP_HIGH: assert property(no_branch_decision_subhelp(bgeu_not_taken, bgeu_inst));

    property branch_taken_state (branch1_taken, branch2_taken);
      !exception
      && (branch1_taken || branch2_taken)
      && exec_state_gbox != TRAP_ENTER
      |-> 
      exec_state_gbox inside {DISPATCH, EXECUTE, BRANCH, BRANCHED};
    endproperty
    ast_branch_taken_state_BEQ_LV2_HELP_HIGH: assert property(branch_taken_state(beq1_taken, beq2_taken));
    ast_branch_taken_state_BNE_LV2_HELP_HIGH: assert property(branch_taken_state(bne1_taken, bne2_taken));
    ast_branch_taken_state_BLT_LV2_HELP_HIGH: assert property(branch_taken_state(blt1_taken, blt2_taken));
    ast_branch_taken_state_BLTU_LV2_HELP_HIGH: assert property(branch_taken_state(bltu1_taken, bltu2_taken));
    ast_branch_taken_state_BGE_LV2_HELP_HIGH: assert property(branch_taken_state(bge1_taken, bge2_taken));
    ast_branch_taken_state_BGEU_LV2_HELP_HIGH: assert property(branch_taken_state(bgeu1_taken, bgeu2_taken));

    property chosen_reg_data_branch_match1(branch1_taken);
      !exception 
      && chosen_reg_flag 
      && (branch1_taken) |-> 
      chosen_reg_data == rs1_data;
    endproperty
    ast_chosen_reg_data_branch_match1_BEQ_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match1(beq1_taken));
    ast_chosen_reg_data_branch_match1_BNE_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match1(bne1_taken));
    ast_chosen_reg_data_branch_match1_BLT_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match1(blt1_taken));
    ast_chosen_reg_data_branch_match1_BLTU_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match1(bltu1_taken));
    ast_chosen_reg_data_branch_match1_BGE_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match1(bge1_taken));
    ast_chosen_reg_data_branch_match1_BGEU_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match1(bgeu1_taken));

    property chosen_reg_data_branch_match2(branch2_taken);
      !exception 
      && chosen_reg_flag 
      && (branch2_taken) |-> 
      chosen_reg_data == rs2_data;
    endproperty
    ast_chosen_reg_data_branch_match2_BEQ_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match2(beq2_taken));
    ast_chosen_reg_data_branch_match2_BNE_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match2(bne2_taken));
    ast_chosen_reg_data_branch_match2_BLT_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match2(blt2_taken));
    ast_chosen_reg_data_branch_match2_BLTU_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match2(bltu2_taken));
    ast_chosen_reg_data_branch_match2_BGE_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match2(bge2_taken));
    ast_chosen_reg_data_branch_match2_BGEU_LV2_HELP_HIGH: assert property(chosen_reg_data_branch_match2(bgeu2_taken));

    property chosen_reg_data_no_branch_match1(branch1_not_taken);
      !exception 
      && chosen_reg_flag 
      && (branch1_not_taken) |-> 
      chosen_reg_data == rs1_data;
    endproperty
    ast_chosen_reg_data_match1_BEQ_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match1(beq1_not_taken));
    ast_chosen_reg_data_match1_BNE_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match1(bne1_not_taken));
    ast_chosen_reg_data_match1_BLT_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match1(blt1_not_taken));
    ast_chosen_reg_data_match1_BLTU_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match1(bltu1_not_taken));
    ast_chosen_reg_data_match1_BGE_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match1(bge1_not_taken));
    ast_chosen_reg_data_match1_BGEU_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match1(bgeu1_not_taken));

    property chosen_reg_data_no_branch_match2(branch2_not_taken);
      !exception 
      && chosen_reg_flag 
      && (branch2_not_taken) |-> 
      chosen_reg_data == rs2_data;
    endproperty
    ast_chosen_reg_data_match2_BEQ_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match2(beq2_not_taken));
    ast_chosen_reg_data_match2_BNE_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match2(bne2_not_taken));
    ast_chosen_reg_data_match2_BLT_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match2(blt2_not_taken));
    ast_chosen_reg_data_match2_BLTU_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match2(bltu2_not_taken));
    ast_chosen_reg_data_match2_BGE_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match2(bge2_not_taken));
    ast_chosen_reg_data_match2_BGEU_LV2_HELP_HIGH: assert property(chosen_reg_data_no_branch_match2(bgeu2_not_taken));

////////////////////////////////////////////////////////////////////////////////
// CONSTRAINTS
////////////////////////////////////////////////////////////////////////////////

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
