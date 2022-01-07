#!/bin/bash
process_names=("cloudphotosd" "Photos" "CCXProcess" "photoanalysisd" "photolibraryd")
# TODO: Wondershare Helper Compact

date +'%m/%d/%Y %H:%M'
for process_name in ${process_names[@]}; do
    # echo $process_name
    pids=$(pgrep $process_name)
    printf "$process_name\tpids=$pids\n"
    if [ -n "$pids" ]; then 
        echo killing $process_name
        kill -9 $pids
    fi
done