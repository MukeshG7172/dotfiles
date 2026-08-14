#!/bin/sh

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    echo '{"text": "󰏤", "tooltip": "Pause", "class": "playing"}'
elif [ "$status" = "Paused" ]; then
    echo '{"text": "󰐊", "tooltip": "Play", "class": "paused"}'
else
    echo '{"text": "󰐊", "tooltip": "Play", "class": "stopped"}'
fi
