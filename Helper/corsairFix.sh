#!/usr/bin/env bash
# Credit: https://askubuntu.com/questions/778514/mouse-becomes-unusable-after-corsair-headset

# get headset dongle id
corsairId=$(xinput --list | grep "Corsair Corsair VOID PRO Wireless Gaming Headset" | grep -oP '(?<=id=)\d*')
if [ -z "$corsairId" ]; then # if not found then error
    echo "Corsair VOID Dongle was not found!"
else # if found then enable the device and fix the bug
    xinput set-int-prop $corsairId "Device Enabled" 8 0
fi
