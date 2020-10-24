#!/usr/bin/env bash
tmux new -d -s "HW Monitor" 'watch -n 2 sensors ; read'
tmux split-window -h 'glances ; read'
tmux -2 attach-session -d
