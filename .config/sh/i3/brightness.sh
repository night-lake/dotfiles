#! /bin/bash

REGEX_BRIGHTNESSCTL_PRECENTAGE="Current brightness: [0-9]{1,17} \((?<precentage>[0-9]{1,3})%\)"

case $1 in
up)
        brightnessctl set +5%
        curr_brightness=$(brightnessctl)

        if [[ $curr_brightness =~ $REGEX_BRIGHTNESSCTL_PRECENTAGE ]]; then
                echo ${BASH_REMATCH[1]}
                notify-send "SCREEN ${BASH_REMATCH[1]}" "Brightness is now $precentage%" -h int:value:$precentage -i audio-volume-high -h string:x-canonical-private-synchronous:brightness -u low -t 3000
                canberra-gtk-play -i audio-volume-change
        fi
        ;;
down)
        brightnessctl set 5%-
        brightness=$(brightnessctl get)
        max_brightness=$(brightnessctl max)
        precentage=$((($brightness / $max_brightness) * 100))

        notify-send "SCREEN" "Brightness is now $precentage%" -h int:value:$precentage -i audio-volume-high -h string:x-canonical-private-synchronous:brightness -u low -t 3000
        canberra-gtk-play -i audio-volume-change
        ;;
esac
