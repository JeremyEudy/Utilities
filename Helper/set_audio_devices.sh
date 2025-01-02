#!/usr/bin/env bash

for i in "$@"
do
    case $i in
        mixer)
            pactl set-default-sink alsa_output.usb-Allen___Heath_ZEDi10-00.Recording__Line1__sink && \
                pactl set-default-source alsa_input.usb-Allen___Heath_ZEDi10-00.Recording__Mic2__source
            ;;
        speakers)
            pactl set-default-sink alsa_output.pci-0000_31_00.4.analog-stereo && \
                pactl set-default-source alsa_input.usb-Corsair_Corsair_VOID_PRO_Wireless_Gaming_Headset-00.mono-fallback
            ;;
        phones)
            pactl set-default-sink alsa_output.usb-Corsair_Corsair_VOID_PRO_Wireless_Gaming_Headset-00.analog-stereo && \
                pactl set-default-source alsa_input.usb-Corsair_Corsair_VOID_PRO_Wireless_Gaming_Headset-00.mono-fallback
            ;;
        guitar)
            pactl set-default-sink alsa_output.usb-Allen___Heath_ZEDi10-00.Recording__Line1__sink && \
                pactl set-default-source alsa_input.usb-Allen___Heath_ZEDi10-00.Recording__Mic1__source
            ;;
        vr)
            pactl set-default-sink ALVR\ Audio && \
                pactl set-default-source ALVR\ Microphone
            ;;
        tv)
            pactl set-default-sink alsa_output.pci-0000_2f_00.1.hdmi-stereo-extra3 && \
                pactl set-default-source alsa_input.usb-Corsair_Corsair_VOID_PRO_Wireless_Gaming_Headset-00.mono-fallback
            ;;
        *)
            ;;
    esac
done
