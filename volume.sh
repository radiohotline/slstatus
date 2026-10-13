#!/bin/sh

vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d%%", $2 * 100}')
mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c "MUTED")

# remove % sign for comparison
vol_num=$(echo "$vol" | tr -d '%')

if [ "$mute" -gt 0 ]; then
    icon="󰝟 "
elif [ "$vol_num" -ge 70 ]; then
    icon=" "
elif [ "$vol_num" -ge 30 ]; then
    icon=" "
else
    icon=" "
fi

printf "%s %s" "$icon" "$vol"
