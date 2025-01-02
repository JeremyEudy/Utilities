#!/usr/bin/env bash

if [ -n "$1" ]; then
    cd "$1"
fi
exec tmux
