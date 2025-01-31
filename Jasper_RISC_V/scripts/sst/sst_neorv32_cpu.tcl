################################################################################
# SST on top target
################################################################################
proc run_sst_main_proc {} {

  # assert -disable {*BNE_HELP*}
  # Is run in the main task (<embedded>)

  ### Mark all assertions with sufix HELP_HIGH as proven helpers -> 
  ### Essentially used as assumptions to reduce the state space during the proof of the target property
  assert -set_helper *MAIN_HELP_HIGH*
  assert -mark_proven *MAIN_HELP_HIGH*

  # Prove the target with helpers used as an assumptions (helpers marked as proven) -> ASSUME NODE
  prove -property *TARGET* -sst 6 -set helper 
  prove -property *TARGET* -with_helpers -bg

  # It is better to prove all helpers together 
  task -create main_target_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {*MAIN_HELP_HIGH*}
  # assert -enable {*BNE_HELP*}
  prove -bg -task {main_target_G}
}


################################################################################
# SST on LV1 subtargets
################################################################################
proc run_sst_lv1_proc {} {
  ### ASSUME NODE
  set lv1_target "{*next_pc_branch_BEQ*} {*next_pc_increment_BEQ*}"

  task -create subtarget_lv1_A -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy "$lv1_target {*LV1_HELP_HIGH*}"

  assert -set_helper *LV1_HELP_HIGH*
  assert -mark_proven *LV1_HELP_HIGH*

  prove -property $lv1_target -sst 6 -set helper 
  prove -property $lv1_target -with_helpers -bg

  ### GUARANTEE NODE
  # Some of current level subhelpers will be hard to prove and they will become the target for the next sub level
  task -create subtarget_lv1_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {{*LV1_HELP_HIGH*}}
  # prove -bg -task {subtarget_lv1_G}
}

proc run_sst_lv2_proc {} {
  ################################################################################
  # SST on LV2 subtargets
  ################################################################################
  ### ASSUME NODE
  set lv2_target "{*branch_decision*}"
  task -create subtarget_lv2_A -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy "$lv2_target {*LV2_HELP_HIGH*}"

  assert -set_helper *LV2_HELP_HIGH*
  assert -mark_proven *LV2_HELP_HIGH*

  prove -property $lv2_target -sst 6 -set helper 
  prove -property $lv2_target -with_helpers -bg

  ### GUARANTEE NODE
  # Some of current level subhelpers will be hard to prove and they will become the target for the next sub level
  task -create subtarget_lv2_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {{*LV2_HELP_HIGH*}}
  prove -bg -task {subtarget_lv2_G}
}

proc run_sst_lv3_proc {} {
  ################################################################################
  # SST on lv3 subtargets
  ################################################################################
  ### ASSUME NODE
  set lv3_target "{*ast_chosen_reg_data_branch_match1_BGEU_LV2_HELP_HIGH*}"
  task -create subtarget_lv3_A -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy "$lv3_target {*LV3_HELP_HIGH*}"

  # Mark all assertions with appropriate suffix as helpers
  assert -set_helper *LV3_HELP_HIGH*
  # Mark them as proven (will behave as assumptions, which were proven in _G task)
  assert -mark_proven *LV3_HELP_HIGH*

  # Run SST on target property 
  prove -property $lv3_target -sst 6 -set helper 
  # Prove target property with helpers
  prove -property $lv3_target -with_helpers -bg

  ### GUARANTEE NODE
  # Some of current level subhelpers will be hard to prove and they will become the target for the next sub level
  task -create subtarget_lv3_G -set -source_task <embedded> -copy_stopats -copy_ratings -copy_abstractions all -copy_assumes -copy {{*LV3_HELP_HIGH*}}
  prove -bg -task {subtarget_lv3_G}
}