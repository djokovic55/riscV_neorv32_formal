
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
  parameter [2:0] BEQ = 3'b000;
  parameter [2:0] ADDI = 3'b000;

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

  // for case splitting
  logic sub_inst, or_inst, addi_inst, beq_inst, jal_inst, jalr_inst;
  
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
        if(funct3 == BEQ) begin

          imm32 = {{20{dut_inst_gbox[31]}},      // IMM[31:12]
                  dut_inst_gbox[7],             // IMM[11]
                  dut_inst_gbox[30:25],        // IMM[10:5]
                  dut_inst_gbox[11:8],        // IMM[4:1]
                  1'b0                       // IMM[0]
                  };

          // Branch can not affect registers, only PC
          // If there was previously only ADDI then here we should just keep the previous value 
          chosen_reg_flag_next = chosen_reg_flag;
          chosen_reg_data_next = chosen_reg_data;

          beq_inst = 1'b1;

          // This is a BUG because BEQ will be checked also in case where none of the sourse regs are chosen ones which is a FALSE negative
          // Check this first
          // inst_supported = BEQ_SWITCH;
          if(rs1 == chosen_reg_ndc) begin
            inst_supported = BEQ_SWITCH;
            if(chosen_reg_data == rs2_data) 
              next_pc_assign(dut_pc_gbox + imm32);
            else
              pc_inc();
          end
          else if(rs2 == chosen_reg_ndc) begin
            inst_supported = BEQ_SWITCH;
            if(rs1_data == chosen_reg_data)
              next_pc_assign(dut_pc_gbox + imm32);
            else
              pc_inc();
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
  ast_pc_main_check:                    assert property(!exception && pc_we_gbox && inst_supported && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // Check one cycle earlier
  ast_next_pc_main_check:               assert property(!exception && pc_we_gbox && inst_supported && chosen_reg_flag |-> tb_pc_next == dut_next_pc_gbox);
  // ast_pc_main_check:                    assert property(pc_we_gbox && inst_supported && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // CHECK CHOSEN REG
  ast_chosen_reg_check:                 assert property(!exception && regs_we_gbox && inst_supported && chosen_reg_flag && (rd == chosen_reg_ndc) |=> dut_regs_gbox[chosen_reg_ndc] == chosen_reg_data);

  cov_beq_check_sanity:                 cover property((pc_we_gbox && inst_supported && !trap_event && chosen_reg_flag) && (opcode_gbox == OPCODE_BRANCH));
  
  ////////////////////////////////////////////////////////////////////////////////
  // CASE SPLIT
  ////////////////////////////////////////////////////////////////////////////////
  // 0f:l40i <Esc>020l040ldwj
  // // INSTRUCTIONS per instr
  // ast_pc_main_SUB_check:                assert property(!exception && pc_we_gbox && (inst_supported && sub_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // ast_pc_main_OR_check:                 assert property(!exception && pc_we_gbox && (inst_supported && or_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  // ast_pc_main_ADDI_check:               assert property(!exception && pc_we_gbox && (inst_supported && addi_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  ast_pc_main_BEQ_check:                assert property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag |=> tb_pc == dut_pc_gbox);
  //Check one cycle earlier
  ast_next_pc_main_BEQ_check:                assert property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag |-> tb_pc_next == dut_next_pc_gbox);
  cov_BEQ:                              cover property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && branch_taken);
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
  // SST HELPERS for pc main BEQ check
  ////////////////////////////////////////////////////////////////////////////////
  ast_pc_BEQ_no_branch_help_new:            assert property(!exception && pc_we_gbox && (inst_supported && beq_inst) && chosen_reg_flag && !branch_taken |-> dut_next_pc_gbox == (dut_pc_gbox + 4));

  property crd_rs1_no_branch_help;
    !exception && 
    (inst_supported && beq_inst) && 
    chosen_reg_flag && 
    $past(rs1) == chosen_reg_ndc && 
    $fell(branch_taken) 
    |-> 
    $past(chosen_reg_data) != $past(rs2_data); 
  endproperty
  // ast_crd_rs1_no_branch_help_new: assert property(crd_rs1_no_branch_help);

  property crd_rs2_no_branch_help;
    !exception && 
    (inst_supported && beq_inst) && 
    chosen_reg_flag && 
    $past(rs2) == chosen_reg_ndc && 
    $fell(branch_taken) 
    |-> 
    $past(chosen_reg_data) != $past(rs1_data); 
  endproperty
  // ast_crd_rs2_no_branch_help_new: assert property(crd_rs2_no_branch_help);

  //add_sub res

  ////////////////////////////////////////////////////////////////////////////////
  // AUX CHECK
  ////////////////////////////////////////////////////////////////////////////////

  // Chosen flag can only be asserted for supported instructions
  ast_aux_chosen_flag:                  assert property(chosen_reg_flag_next |-> opcode_gbox == OPCODE_ALUI || opcode_gbox == OPCODE_BRANCH);




  ////////////////////////////////////////////////////////////////////////////////
  // PROPERTIES
  ////////////////////////////////////////////////////////////////////////////////
  // ast_pc: assert property(pc_we_gbox && !jump_ir_gbox && !trap_event |=> (pc == ($past(pc) + 4)) || ($past(pc) == pc));

  // ast_pc2_target: assert property(pc_we_gbox && pc != '0 && !jump_ir_gbox && !trap_event |=> pc == ($past(pc) + 4) || pc == ($past(pc) + 2));

  // ast_pc3_target: assert property(pc_we_gbox && pc != '0 && !jump_ir_gbox |=> pc == ($past(pc) + 4));

  // cov_same_pc: cover property(pc_we_gbox |=> ($past(pc) == pc));
  // Jump instruction (JALR) can always make an example of jumping to the same instruction causing pc to remain stable
  // ast_no_same_pc_if_initial: assert property(pc_we_gbox && pc != '0 && !jump_ir_gbox && !trap_event |=> !($past(pc) == pc));
  // cov_pc_we: cover property(pc_we_gbox[->3]);

  // Jump analysis
  // cov_jump: cover property(pc_we_gbox && pc != '0 && !trap_event |=> !(pc == ($past(pc) + 4)) || ($past(pc) == pc));

  // cov_same_pc_after_inital_case_target: cover property(pc_we_gbox[=4] ##1 (!jump_ir_gbox && !trap_event && pc_we_gbox) |=> ($past(pc) == pc));

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

  logic[32:0] inst_top;
  assign inst_top = dbus_rsp_i[32:2];

  logic[6:0] opcode_top;
  assign opcode_top = inst_top[6:0];

  logic inst_supported_top;
  assign inst_supported_top = (opcode_top == OPCODE_ALUR) ||
                              (opcode_top == OPCODE_ALUI) ||
                              (opcode_top == OPCODE_JAL) ||
                              (opcode_top == OPCODE_JALR) ||
                              (opcode_top == OPCODE_BRANCH);

  // Disable interrupts
  asm_no_irqs: assume property(interrupts == '0);
  // Allow only supported instructions
  asm_only_supp_inst: assume property(inst_supported_top);
endmodule