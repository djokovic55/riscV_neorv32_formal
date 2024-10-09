<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>30</insertion-point-position>
  <wave>
    <expr>clk_i</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.execute_engine.state</expr>
    <label/>
    <radix>neorv32_cpu_control_inst.execute_engine.state</radix>
    <wave>
      <expr>neorv32_cpu_control_inst.execute_engine.state(3)</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.execute_engine.state(2)</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.execute_engine.state(1)</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.execute_engine.state(0)</expr>
      <label/>
      <radix/>
    </wave>
  </wave>
  <wave>
    <expr>chk_cpu.trap_event</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>neorv32_cpu_control_inst.imm_o</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <group collapsed="false">
    <expr>neorv32_cpu_control_inst.execute_engine</expr>
    <label>neorv32_cpu_control_inst.execute_engine</label>
    <radix/>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.execute_engine.state</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.execute_engine.state</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.execute_engine.state_nxt</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.execute_engine.state</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.execute_engine.ir</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.execute_engine.ir_nxt</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.execute_engine.is_ci</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.execute_engine.is_ci_nxt</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.execute_engine.branch_taken</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.execute_engine.pc</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.execute_engine.pc_we</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.execute_engine.next_pc</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.execute_engine.next_pc_inc</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.execute_engine.link_pc</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <group collapsed="true">
    <expr>neorv32_cpu_control_inst.decode_aux</expr>
    <label>neorv32_cpu_control_inst.decode_aux</label>
    <radix/>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.decode_aux.opcode</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.decode_aux.opcode</radix>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.is_a_lr</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.is_a_sc</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.is_f_op</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.is_m_mul</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.is_m_div</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.is_b_imm</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.is_b_reg</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.is_zicond</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.rs1_zero</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.decode_aux.rd_zero</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <group collapsed="true">
    <expr/>
    <label>REGS</label>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(0)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(1)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(2)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(3)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(4)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(5)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(6)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(7)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(8)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(9)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(10)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(11)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(12)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(13)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(14)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(15)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(16)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(17)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(18)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(19)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(20)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(21)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(22)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(23)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(24)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(25)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(26)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(27)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(28)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(29)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(30)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_regfile_inst.reg_file(31)</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
  </group>
  <group collapsed="false">
    <expr>neorv32_cpu_control_inst.fetch_engine</expr>
    <label>neorv32_cpu_control_inst.fetch_engine</label>
    <radix/>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.fetch_engine.state</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.state</radix>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.fetch_engine.restart</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.fetch_engine.pc</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.fetch_engine.reset</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.fetch_engine.resp</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.fetch_engine.priv</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <group collapsed="true">
    <expr>neorv32_cpu_control_inst.issue_engine</expr>
    <label>neorv32_cpu_control_inst.issue_engine</label>
    <radix/>
    <wave>
      <expr>neorv32_cpu_control_inst.issue_engine.align</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.issue_engine.align_set</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.issue_engine.align_clr</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.issue_engine.ci_i16</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.issue_engine.ci_i32</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.issue_engine.data</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.issue_engine.valid</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.issue_engine.ack</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <group collapsed="true">
    <expr>neorv32_cpu_control_inst.trap_ctrl</expr>
    <label>neorv32_cpu_control_inst.trap_ctrl</label>
    <radix/>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.trap_ctrl.exc_buf</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.exc_fire</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.trap_ctrl.irq_pnd</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.trap_ctrl.irq_buf</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.trap_ctrl.irq_fire</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.trap_ctrl.cause</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.trap_ctrl.cause</radix>
    </wave>
    <wave collapsed="true">
      <expr>neorv32_cpu_control_inst.trap_ctrl.epc</expr>
      <label/>
      <radix>neorv32_cpu_control_inst.fetch_engine.pc</radix>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.env_pending</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.env_enter</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.env_entered</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.env_exit</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.wakeup</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.instr_be</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.instr_ma</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.instr_il</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.ecall</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.ebreak</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>neorv32_cpu_control_inst.trap_ctrl.hwtrig</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <spacer/>
</wavelist>
