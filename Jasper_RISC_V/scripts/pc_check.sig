<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>68</insertion-point-position>
  <wave>
    <expr>clk_i</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.execute_engine.state</expr>
    <label/>
    <radix>neorv32_cpu_control_inst.execute_engine.state</radix>
  </wave>
  <wave>
    <expr>chk_cpu.pc_we_gbox</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.dut_pc_gbox</expr>
    <label/>
    <radix>chk_cpu.dut_pc_gbox</radix>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.execute_engine.next_pc</expr>
    <label/>
    <radix>chk_cpu.dut_regs_gbox(2)</radix>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.tb_pc</expr>
    <label/>
    <radix>chk_cpu.dut_pc_gbox</radix>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.tb_pc_next</expr>
    <label/>
    <radix>chk_cpu.dut_pc_gbox</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>neorv32_cpu_alu_inst.addsub_res</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.execute_engine.next_pc</expr>
    <label/>
    <radix>chk_cpu.dut_regs_gbox(2)</radix>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.execute_engine.next_pc_inc</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave>
    <expr>chk_cpu.jalr_edge</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_alu_inst.imm_i</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.pc_jalr</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>chk_cpu.inst_supported</expr>
    <label/>
    <radix>chk_cpu.inst_supported</radix>
  </wave>
  <wave>
    <expr>chk_cpu.jump_ir_gbox</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>neorv32_cpu_control_inst.execute_engine.branch_taken</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave>
    <expr>chk_cpu.jalr_inst</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.opcode_gbox</expr>
    <label/>
    <radix>chk_cpu.opcode_gbox</radix>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.funct3</expr>
    <label/>
    <radix>chk_cpu.funct3</radix>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.chosen_reg_ndc</expr>
    <label/>
    <radix>dec</radix>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.chosen_reg_data</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.chosen_reg_data_next</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.imm32</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.execute_engine.state</expr>
    <label/>
    <radix>neorv32_cpu_control_inst.execute_engine.state</radix>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.execute_engine.next_pc_inc</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.rs1</expr>
    <label/>
    <radix>dec</radix>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.rs1_data</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.rs2</expr>
    <label/>
    <radix>dec</radix>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.rs2_data</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.rd</expr>
    <label/>
    <radix>dec</radix>
  </wave>
  <wave>
    <expr>chk_cpu.chosen_reg_flag_next</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>neorv32_cpu_regfile_inst.ctrl_i.rf_wb_en</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>chk_cpu.chosen_reg_flag</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <group collapsed="true">
    <expr/>
    <label>REGS</label>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(0)</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(1)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(2)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(3)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(4)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(5)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(6)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(7)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(8)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(9)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(10)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(11)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(12)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(13)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(14)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(15)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(16)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(17)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(18)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(19)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(20)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(21)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(22)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(23)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(24)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(25)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(26)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(27)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(28)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(29)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(30)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
    <wave collapsed="true">
      <expr>chk_cpu.dut_regs_gbox(31)</expr>
      <label/>
      <radix>neorv32_cpu_regfile_inst.reg_file(31)</radix>
    </wave>
  </group>
  <wave collapsed="true">
    <expr>chk_cpu.dut_inst_gbox</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.issue_engine.data</expr>
    <label/>
    <radix/>
  </wave>
  <group collapsed="false">
    <expr>dbus_rsp_i</expr>
    <label>dbus_rsp_i</label>
    <radix/>
    <wave collapsed="true">
      <expr>dbus_rsp_i.data</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>dbus_rsp_i.ack</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>dbus_rsp_i.err</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <wave collapsed="true">
    <expr>chk_cpu.opcode_top</expr>
    <label/>
    <radix>chk_cpu.opcode_top</radix>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.opcode_gbox</expr>
    <label/>
    <radix>chk_cpu.opcode_gbox</radix>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.execute_engine.ir_nxt</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave>
    <expr>neorv32_cpu_control_inst.prefetch_buffer(0).prefetch_buffer_inst.we</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>neorv32_cpu_control_inst.prefetch_buffer(1).prefetch_buffer_inst.we</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>neorv32_cpu_control_inst.prefetch_buffer(1).prefetch_buffer_inst.we_i</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>neorv32_cpu_control_inst.prefetch_buffer(1).prefetch_buffer_inst.free</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.fetch_engine.state</expr>
    <label/>
    <radix>neorv32_cpu_control_inst.fetch_engine.state</radix>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.prefetch_buffer(0).prefetch_buffer_inst.fifo_mem(0)</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.prefetch_buffer(0).prefetch_buffer_inst.fifo_mem(1)</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.prefetch_buffer(1).prefetch_buffer_inst.fifo_mem(0)</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.prefetch_buffer(1).prefetch_buffer_inst.fifo_mem(1)</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.prefetch_buffer(0).prefetch_buffer_inst.wdata_i</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.inst_top</expr>
    <label/>
    <radix/>
  </wave>
  <group collapsed="false">
    <expr>ibus_rsp_i</expr>
    <label>ibus_rsp_i</label>
    <radix/>
    <wave collapsed="true">
      <expr>ibus_rsp_i.data</expr>
      <label/>
      <radix/>
      <wave>
        <expr>ibus_rsp_i.data(31)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(30)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(29)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(28)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(27)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(26)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(25)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(24)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(23)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(22)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(21)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(20)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(19)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(18)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(17)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(16)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(15)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(14)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(13)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(12)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(11)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(10)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(9)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(8)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(7)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(6)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(5)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(4)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(3)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(2)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(1)</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>ibus_rsp_i.data(0)</expr>
        <label/>
        <radix/>
      </wave>
    </wave>
    <wave>
      <expr>ibus_rsp_i.ack</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>ibus_rsp_i.err</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <wave>
    <expr>pmp_ex_fault</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.issue_engine.data</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>chk_cpu.dut_inst_gbox</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>chk_cpu.exception</expr>
    <label/>
    <radix/>
  </wave>
  <highlightlist>
    <!--Users can remove the highlightlist block if they want to load the signal save file into older version of Jasper-->
    <highlight>
      <expr>chk_cpu.dut_pc_gbox</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>chk_cpu.inst_top</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>chk_cpu.opcode_gbox</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>chk_cpu.rs1_data</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>chk_cpu.rs2_data</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>chk_cpu.tb_pc</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>neorv32_cpu_control_inst.execute_engine.ir_nxt</expr>
      <color>builtin_blue</color>
    </highlight>
  </highlightlist>
</wavelist>
