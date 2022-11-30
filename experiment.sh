#!/bin/bash

# ========= #
# FUNCTIONS #
# ========= #

# ===================================================================== #

# Error message 

error_exit()
{
  echo -e "\n$1\n" 1>&2
  exit 1
}

# Open a session using tmux

open_session()
{
  session_name=$1

  # Check if the session exists, discarding output
  # We can check $? for the exit status (zero for success, non-zero for failure)
  tmux has-session -t $session_name 2>/dev/null
  if [ $? != 0 ]; then
    echo "No session has been found"
  else 
    echo "Session <$session_name> has been found"
    echo "Do you want to close it? [ans=1,2,3]"

    select yn in "yes" "no"; do
      case $yn in
        yes ) echo -e "Closing session <$session_name>"; tmux kill-ses -t $session_name; break;;
        no ) 	error_exit "Aborting...";;
      esac
    done

  fi

  tmux new-session -d -s $session_name
  echo -e "Opening session <$session_name>"
}

# ===================================================================== #

# Setup experiment

setup_experiment()
{
  session_name=$1
  experiment_id=$2

  # Send commands
  tmux send-keys -t $session_name:$experiment_id "env_esim" C-m
  tmux send-keys -t $session_name:$experiment_id "hero" C-m
  tmux send-keys -t $session_name:$experiment_id "make sdk-arov-cfg" C-m
}

# ===================================================================== #

# Compile experiment

compile_experiment()
{
  session_name=$1
  experiment_id=$2

  # experiment
  experiment_repo=$3
  experiment_name=$4

  # Send commands
  tmux send-keys -t $session_name:$experiment_id "cd $experiment_repo" C-m
  tmux send-keys -t $session_name:$experiment_id "make build \
                                SRC_TARGET=$experiment_name; \
                                                  tmux wait -S end_build_sw" C-m

  # Wait for the end of software compilation to prevent other tmux  
  # sessions (starting concurrently and in different windows) to clean 
  # the compilation files used by the current session   
  tmux wait end_build_sw 
}

# ===================================================================== #

# Run experiment

run_experiment()
{
  session_name=$1
  experiment_id=$2

  # experiment
  experiment_repo=$3
  experiment_name=$4
  target_ov=$5

  # Send commands
  tmux send-keys -t $session_name:$experiment_id "arov" C-m
  tmux send-keys -t $session_name:$experiment_id "make vsim_clean vsim_hw \
                                TARGET_OV=$target_ov \
                                VSIM_SW_PATH=$experiment_repo/src/$experiment_name \
                                VSIM_PRJ_NAME=$session_name\_$experiment_id\_$experiment_name \
                                VSIM_GUI=0; \
                                                  tmux wait -S end_build_hw" C-m

  # Wait for the end of hardware compilation (QuestaSim flow) to prevent other 
  # tmux sessions  (starting concurrently and in different windows) to clean 
  # the compilation files used by the current session                         
  tmux wait end_build_hw

  tmux send-keys -t $session_name:$experiment_id "make vsim_sim \
                                TARGET_OV=$target_ov \
                                VSIM_SW_PATH=$experiment_repo/src/$experiment_name \
                                VSIM_PRJ_NAME=$session_name\_$experiment_id\_$experiment_name \
                                VSIM_GUI=0" C-m
}

# ===================================================================== #

# Close the tmux session

close_session()
{
  session_name=$1
  tmux kill-ses -t $session_name
  echo -e "Closing session <$session_name>"
}

# ===================================================================== #

          # Parameters #

session_name="session_301122"
experiment_repo=$AGILE_ACC_RICH_DIR/sw/experiments/perf-profiling

declare -a experiment_name=( \
        "1cl-16tg-1p-compute" \
        "1cl-16tg-1p-memory" \
        "2cl-8tg-1p-compute" \
        "2cl-8tg-1p-memory" \
        "4cl-4tg-1p-compute" \
        "4cl-4tg-1p-memory" \
        "8cl-2tg-1p-compute" \
        "8cl-2tg-1p-memory" \
        "16cl-1tg-1p-compute" \
        "16cl-1tg-1p-memory" \
        "16cl-1tg-2p-compute" \
        "16cl-1tg-2p-memory"  \
        "16cl-1tg-4p-compute" \
        "16cl-1tg-4p-memory"  \
        "16cl-1tg-8p-compute" \
        "16cl-1tg-8p-memory" \
        "16cl-1tg-16p-compute" \
        "16cl-1tg-16p-memory" )

declare -a pulp_sdk_name=( \
        "arov_ncl1_nacc16" \
        "arov_ncl1_nacc16" \
        "arov_ncl2_nacc8" \
        "arov_ncl2_nacc8" \
        "arov_ncl4_nacc4" \
        "arov_ncl4_nacc4" \
        "arov_ncl8_nacc2" \
        "arov_ncl8_nacc2" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" \
        "arov_ncl16_nacc1" )

declare -a target_ov=( \
        "agile_1cl_16tg_2p" \
        "agile_1cl_16tg_2p" \
        "agile_2cl_8tg_2p" \
        "agile_2cl_8tg_2p" \
        "agile_4cl_4tg_2p" \
        "agile_4cl_4tg_2p" \
        "agile_8cl_2tg_2p" \
        "agile_8cl_2tg_2p" \
        "agile_16cl_1tg_2p" \
        "agile_16cl_1tg_2p" \
        "agile_16cl_1tg_16p" \
        "agile_16cl_1tg_16p" \
        "agile_16cl_1tg_16p" \
        "agile_16cl_1tg_16p" \
        "agile_16cl_1tg_16p" \
        "agile_16cl_1tg_16p" \
        "agile_16cl_1tg_16p" \
        "agile_16cl_1tg_16p" )

n_experiment=${#experiment_name[@]}

          # Session - START #

# Launch new experiments session!
open_session $session_name

#           # Run experiments #

for ((experiment_id=0; experiment_id<n_experiment; experiment_id++)); do
  
  echo -e "\nInitializing experiment #$experiment_id: <${experiment_name[$experiment_id]}>";

  # Create one window for each experiment of the current session
  if [ "$experiment_id" -ge 1 ]; then
    tmux new-window -t $session_name:$experiment_id -n ${experiment_name[$experiment_id]};
  else
    tmux rename-window -t $session_name:$experiment_id ${experiment_name[$experiment_id]}; 
  fi

  # Adapt HERO configuration file
  cfg_file=$HERO_OV_HOME_DIR/local.cfg
  if [ -f ${cfg_file} ] && grep -q OV_CFG_DEV ${cfg_file}; then
    echo "HERO configuration file -> Configured to ${pulp_sdk_name[$experiment_id]}"
    sed -c -i "s/\($OV_CFG_DEV *= *\).*/\1${pulp_sdk_name[$experiment_id]}/" $HERO_OV_HOME_DIR/local.cfg
  else
    echo "HERO configuration file -> Not found"
  fi

  # Experiment setup (env, SDK)
  setup_experiment $session_name $experiment_id

  # Compile SW (one per time)
  compile_experiment $session_name $experiment_id $experiment_repo ${experiment_name[$experiment_id]};

  # Launch experiment
  run_experiment $session_name $experiment_id $experiment_repo ${experiment_name[$experiment_id]} ${target_ov[$experiment_id]};
  
done

          # Session - END #

# Close experiments session once all experiments are terminated
# close_session $session_name