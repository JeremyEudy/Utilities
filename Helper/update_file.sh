#!/usr/bin/env bash

if [ ! "$TMUX" ]; then
    tmux new-session "vim -nR $1" \; split-window -h "vim $1" \;
else
    tmux split-window -h "vim $1" && tmux select-pane -L && vim -nR $1
fi
