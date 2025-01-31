# Script description

## Main scripts
- run_jg.tcl 
    - Project build, rtl and verif files compilation for NEORV32 soc level
    - **Not used**
- run_cpu_jg.tcl 
    - Project build, rtl and verif files compilation for NEORV32 cpu level
    - Is run with *make check_cpu* command
    - Run from here in tcl terminal SST related precedure calls.
### SST analysis
- ./sst/sst_neorv32_cpu.tcl 
    - Run SST analysis for *ast_next_pc_main_BRANCH_TARGET* property (Branch instruction is the hardest to prove).
    - Used for development of new helper properites
    - **Call:** *run_sst_main_proc*,  *run_sst_lv1_proc*, *run_sst_lv2_proc*, *run_sst_lv3_proc*,
- ./sst/ps_neorv32_cpu.tcl
    - Run JasperGold's Proof structure feature
    - Tree-like structure with Assume-Guarantee nodes
    - Used to easily represent target-helper relationship 
    - **Call:** *run_proof_structure_proc*