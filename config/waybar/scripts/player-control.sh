#!/bin/sh

action="$1"

case "$action" in
    prev)
        echo '{"text": "󰒮", "tooltip": "Previous Track"}'
        ;;
    next)
        echo '{"text": "󰒭", "tooltip": "Next Track"}'
        ;;
    *)
        exit 0
        ;;
esac
