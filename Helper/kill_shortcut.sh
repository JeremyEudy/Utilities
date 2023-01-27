#!/usr/bin/env bash

proc=`ps -C $1 -o pid= | tail -n 1`
kill -KILL $proc
