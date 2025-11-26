#!/usr/bin/env bash

# Get IDs from wpctl status
SPEAKERS="Starship/Matisse HD Audio Controller Analog Stereo"
SPEAKERS_ID=$(wpctl status | grep "$SPEAKERS" | awk -F'.' '{print $1}' | awk '{print $NF}')

MIXER_OUT="alsa_output.usb-Allen___Heath_ZEDi10-00.Recording__Line1__sink \[Audio/Sink\]"
MIXER_OUT_ID=$(wpctl status | grep "$MIXER_OUT" | awk -F'.' '{print $1}' | awk '{print $NF}')

MIC_IN="alsa_input.usb-Allen___Heath_ZEDi10-00.Recording__Mic2__source \[Audio/Source\]"
MIC_IN_ID=$(wpctl status | grep "$MIC_IN" | awk -F'.' '{print $1}' | awk '{print $NF}')

GUITAR_IN="alsa_input.usb-Allen___Heath_ZEDi10-00.Recording__Mic1__source \[Audio/Source\]"
GUITAR_IN_ID=$(wpctl status | grep "$GUITAR_IN" | awk -F'.' '{print $1}' | awk '{print $NF}')

# VR_OUT=""
# VR_OUT_ID=""

# VR_IN=""
# VR_IN_ID=""

for i in "$@"
do
    case $i in
        mixer)
            wpctl set-default $MIXER_OUT_ID && \
                wpctl set-default $MIC_IN_ID
            ;;
        speakers)
            wpctl set-default $SPEAKERS_ID && \
                wpctl set-default $MIC_IN_ID
            ;;
        guitar)
            wpctl set-default $MIXER_OUT_ID && \
                wpctl set-default $GUITAR_IN_ID
            ;;
        # vr)
        #     wpctl set-default VR_OUT_ID && \
        #         wpctl set-default VR_IN_ID
        #     ;;
        *)
            ;;
    esac
done
