
set_fml_appmode FPV

# specify DUT top level module name
set design neorv32_cpu

# analyze -library spec foo.v
# compile DUT and SVA props

# analyze -format vhdl -library neorv32 -vcs {-f RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_cpu.f}
## --------------- To Analyze SV Files ----------------- ##
# analyze -format sverilog {Jasper_RISC_V/env/checks/checker_cpu.sv Jasper_RISC_V/env/cpu_bind.sv} 
# analyze -format vhdl -work neorv32 -vcs {-f RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_cpu.f}
analyze -vcs {-f RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_cpu.f} -format vhdl -work neorv32 
# analyze -format vhdl -vcs {-f RISC_V_NEORV32/neorv32-main/neorv32-main/rtl/file_list_cpu.f}

## --------------- To Analyze SV Files ----------------- ##
analyze {Jasper_RISC_V/env/checks/checker_cpu.sv Jasper_RISC_V/env/cpu_bind.sv} -format sverilog 

set search_path "./"
set link_library " "

# elaborate checker_cpu -sva 
# elaborate $design -work neorv32 -parameters -vcs {-gv (HPM_NUM_CNTS=>0,HPM_CNT_WIDTH=>40)} -sva 
# elaborate $design -work neorv32 -vcs "-lca -sva_bind_enable cpu_bind"
elaborate $design -work neorv32 -sva 

# -param HPM_NUM_CNTS 0 \
# -param HPM_CNT_WIDTH 40 
# Add clock and reset
create_clock clk_i -period 100  
create_clock clk_aux_i -period 100  
create_reset rstn_i -sense low

# Initialize the DUT by holding reset active until sequential elements values are stable
sim_run -stable  
sim_save_reset 