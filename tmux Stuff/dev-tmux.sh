#!/bin/sh 
tmux new-session -s "dev-tmux" -d
tmux split-window -h
tmux split-window -v
tmux -2 attach-session -d 

