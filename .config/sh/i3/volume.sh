#! /bin/bash

case $1 in
up)
        pamixer -u -i 5
        volume="$(pamixer --get-volume)"
        notify-send "VOLUME" "Volume is now $volume%" -h int:value:$volume -i audio-volume-high -h string:x-canonical-private-synchronous:volume -u low -t 3000
        canberra-gtk-play -i audio-volume-change
        ;;
down)
        pamixer -u -d 5
        volume="$(pamixer --get-volume)"

        notify-send "VOLUME" "Volume is now $volume%" -h int:value:$volume -i audio-volume-low -h string:x-canonical-private-synchronous:volume -u low -t 3000
        canberra-gtk-play -i audio-volume-change
        ;;
mute)
        pamixer -t
        muted="$(pamixer --get-mute)"

        if $muted; then
                notify-send "VOLUME" "Muted!" -i audio-volume-muted -h int:value:1 -h string:x-canonical-private-synchronous:volume -u low -t 3000
        else
                volume="$(pamixer --get-volume)"

                notify-send "VOLUME" "Unmuted!" -i audio-volume-medium -h int:value:$volume -h string:x-canonical-private-synchronous:volume -u low -t 3000
                canberra-gtk-play -i audio-volume-change
        fi
        ;;
esac
