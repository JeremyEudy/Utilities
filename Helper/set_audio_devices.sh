#!/usr/bin/env bash

# Get IDs from wpctl status
for i in "$@"
do
    case $i in
        mixer)
            # 106. alsa_output.usb-Allen___Heath_ZEDi10-00.Recording__Line1__sink
            # 111. alsa_input.usb-Allen___Heath_ZEDi10-00.Recording__Mic2__source
            wpctl set-default 106 && \
                wpctl set-default 111
            ;;
        speakers)
            # 57. Starship/Matisse HD Audio Controller Analog Stereo
            wpctl set-default 57
            ;;
        guitar)
            # 113. alsa_input.usb-Allen___Heath_ZEDi10-00.Recording__Mic1__source
            wpctl set-default 106 && \
                wpctl set-default 113
            ;;
        # vr)
        #     pactl set-default-sink ALVR\ Audio && \
        #         pactl set-default-source ALVR\ Microphone
        #     ;;
        *)
            ;;
    esac
done
