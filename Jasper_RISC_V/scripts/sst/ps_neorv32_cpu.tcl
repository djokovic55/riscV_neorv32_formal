
proc run_proof_structure_proc {} {

  task -create PS_SETUP -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy_assert -set 

  # Root node
  proof_structure -init ROOT -from PS_SETUP -copy_all

  # In proof structure feature all helpers should be used in top guarantee node 
  # From there some of them will become targets or remain helpers on sublevels

  # Top node
  set main_target "{*TARGET*}"
  set main_helpers "{*MAIN_HELP_HIGH*} {*LV1_HELP_HIGH*} {*LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from ROOT \
                  -op_name MAIN \
                  -imp_name {MAIN.G MAIN.A} \
                  -property [list ${main_helpers} $main_target]

  ################################################################################
  # BEQ case split
  ################################################################################

  # Lv1 node
  set BEQ_lv1_target "{*next_pc_branch_BEQ*} {*next_pc_increment_BEQ*}"
  set BEQ_lv1_helpers "{*BEQ_LV1_HELP_HIGH*} {*BEQ_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BEQ_LV1 \
                  -imp_name {BEQ_LV1.G BEQ_LV1.A} \
                  -property [list ${BEQ_lv1_helpers} $BEQ_lv1_target]

  # Lv2 node
  set BEQ_lv2_target "{*branch_decision*BEQ_LV1*}"
  set BEQ_lv2_helpers "{*BEQ_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BEQ_LV1.G \
                  -op_name BEQ_LV2 \
                  -imp_name {BEQ_LV2.G BEQ_LV2.A} \
                  -property [list ${BEQ_lv2_helpers} $BEQ_lv2_target]

  ################################################################################
  # BNE case split
  ################################################################################

  # Lv1 node
  set BNE_lv1_target "{*next_pc_branch_BNE*} {*next_pc_increment_BNE*}"
  set BNE_lv1_helpers "{*BNE_LV1_HELP_HIGH*} {*BNE_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BNE_LV1 \
                  -imp_name {BNE_LV1.G BNE_LV1.A} \
                  -property [list ${BNE_lv1_helpers} $BNE_lv1_target]

  # Lv2 node
  set BNE_lv2_target "{*branch_decision*BNE_LV1*}"
  set BNE_lv2_helpers "{*BNE_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BNE_LV1.G \
                  -op_name BNE_LV2 \
                  -imp_name {BNE_LV2.G BNE_LV2.A} \
                  -property [list ${BNE_lv2_helpers} $BNE_lv2_target]

  ################################################################################
  # BLT case split
  ################################################################################

  # Lv1 node
  set BLT_lv1_target "{*next_pc_branch_BLT_*} {*next_pc_increment_BLT_*}"
  set BLT_lv1_helpers "{*BLT_LV1_HELP_HIGH*} {*BLT_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BLT_LV1 \
                  -imp_name {BLT_LV1.G BLT_LV1.A} \
                  -property [list ${BLT_lv1_helpers} $BLT_lv1_target]

  # Lv2 node
  set BLT_lv2_target "{*branch_decision*BLT_LV1*}"
  set BLT_lv2_helpers "{*BLT_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BLT_LV1.G \
                  -op_name BLT_LV2 \
                  -imp_name {BLT_LV2.G BLT_LV2.A} \
                  -property [list ${BLT_lv2_helpers} $BLT_lv2_target]

  ################################################################################
  # BLTU case split
  ################################################################################

  # Lv1 node
  set BLTU_lv1_target "{*next_pc_branch_BLTU_*} {*next_pc_increment_BLTU_*}"
  set BLTU_lv1_helpers "{*BLTU_LV1_HELP_HIGH*} {*BLTU_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BLTU_LV1 \
                  -imp_name {BLTU_LV1.G BLTU_LV1.A} \
                  -property [list ${BLTU_lv1_helpers} $BLTU_lv1_target]

  # Lv2 node
  set BLTU_lv2_target "{*branch_decision*BLTU_LV1*}"
  set BLTU_lv2_helpers "{*BLTU_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BLTU_LV1.G \
                  -op_name BLTU_LV2 \
                  -imp_name {BLTU_LV2.G BLTU_LV2.A} \
                  -property [list ${BLTU_lv2_helpers} $BLTU_lv2_target]

  ################################################################################
  # BGE case split
  ################################################################################

  # Lv1 node
  set BGE_lv1_target "{*next_pc_branch_BGE_*} {*next_pc_increment_BGE_*}"
  set BGE_lv1_helpers "{*BGE_LV1_HELP_HIGH*} {*BGE_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BGE_LV1 \
                  -imp_name {BGE_LV1.G BGE_LV1.A} \
                  -property [list ${BGE_lv1_helpers} $BGE_lv1_target]

  # Lv2 node
  set BGE_lv2_target "{*branch_decision*BGE_LV1*}"
  set BGE_lv2_helpers "{*BGE_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BGE_LV1.G \
                  -op_name BGE_LV2 \
                  -imp_name {BGE_LV2.G BGE_LV2.A} \
                  -property [list ${BGE_lv2_helpers} $BGE_lv2_target]

  ################################################################################
  # BGEU case split
  ################################################################################

  # Lv1 node
  set BGEU_lv1_target "{*next_pc_branch_BGEU_*} {*next_pc_increment_BGEU_*}"
  set BGEU_lv1_helpers "{*BGEU_LV1_HELP_HIGH*} {*BGEU_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from MAIN.G \
                  -op_name BGEU_LV1 \
                  -imp_name {BGEU_LV1.G BGEU_LV1.A} \
                  -property [list ${BGEU_lv1_helpers} $BGEU_lv1_target]

  # Lv2 node
  set BGEU_lv2_target "{*branch_decision*BGEU_LV1*}"
  set BGEU_lv2_helpers "{*BGEU_LV2_HELP_HIGH*}"
  proof_structure -create assume_guarantee \
                  -from BGEU_LV1.G \
                  -op_name BGEU_LV2 \
                  -imp_name {BGEU_LV2.G BGEU_LV2.A} \
                  -property [list ${BGEU_lv2_helpers} $BGEU_lv2_target]
  # prove -task MAIN.A -bg
  # prove -task LV1.A -bg
  # prove -task LV2.A -bg
  # prove -task LV2.G -bg
}