#!/usr/bin/env bash
tmux new -d -s "monitor" 'glances'
tmux split-window -h 'watch "sensors && sudo hddtemp /dev/sd?"'
tmux rename-window "hw-monitor"
tmux new-window 'sudo nethogs'
tmux split-window -h 'slurm -s -i enp3s0'
tmux rename-window "network-monitor"
tmux -2 select-window -t "monitor":"hw-monitor" \; a -t "monitor"
