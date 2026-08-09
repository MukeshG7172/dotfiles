#!/bin/bash

DIR="$HOME/Pictures/wallpapers"
STATE="$HOME/.cache/wallpaper_index"

mkdir -p "$(dirname "$STATE")"

mode="${1:-restore}"

mapfile -t files < <(
    find "$DIR" -type f \( \
        -iname "*.jpg" -o \
        -iname "*.jpeg" -o \
        -iname "*.png" -o \
        -iname "*.webp" -o \
        -iname "*.gif" -o \
        -iname "*.bmp" -o \
        -iname "*.mp4" -o \
        -iname "*.mkv" -o \
        -iname "*.webm" -o \
        -iname "*.mov" -o \
        -iname "*.avi" -o \
        -iname "*.m4v" \
        \) | sort
)

count=${#files[@]}
[ "$count" -eq 0 ] && exit 1

idx=0
[[ -f "$STATE" ]] && idx=$(<"$STATE")

case "$mode" in
next)
    idx=$(((idx + 1) % count))
    ;;
prev)
    idx=$(((idx - 1 + count) % count))
    ;;
restore)
    if ((idx < 0 || idx >= count)); then
        idx=0
    fi
    ;;
esac

echo "$idx" >"$STATE"

file="${files[$idx]}"

monitor=$(hyprctl monitors | awk '/Monitor/{print $2; exit}')
[ -z "$monitor" ] && exit 1

mime=$(file --mime-type -b "$file")

if [[ "$mime" == video/* ]]; then

    pkill -x hyprpaper 2>/dev/null

    if pgrep -x mpvpape >/dev/null; then
        pkill -x mpvpaper
        sleep 0.3
    fi

    mpvpaper \
        -o "no-audio --loop-playlist --hwdec=auto" \
        "$monitor" \
        "$file" &

else

    pkill -x mpvpaper 2>/dev/null

    if ! pgrep -x hyprpaper >/dev/null; then
        hyprpaper &
    fi

    for i in {1..50}; do
        hyprctl hyprpaper listloaded >/dev/null 2>&1 && break
        sleep 0.1
    done

    hyprctl hyprpaper unload all >/dev/null 2>&1
    hyprctl hyprpaper preload "$file"
    hyprctl hyprpaper wallpaper "$monitor,$file"
    hyprctl hyprpaper unload unused >/dev/null 2>&1

fi

