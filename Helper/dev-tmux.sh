#!/bin/sh 
tmux new-session -s "mySession" -d
tmux split-window -h
tmux split-window -v
tmux attach-session -d 
