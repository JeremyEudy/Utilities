#!/usr/bin/env bash
tmux new -d -s "hw-monitor" 'glances ; read'
tmux split-window -h 'watch -n 2 sensors ; read'
tmux split-window -v 'sudo nethogs'
tmux split-window -v 'slurm -s -i enp3s0'
tmux -2 attach-session -d
