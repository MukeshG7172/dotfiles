#!/bin/sh

escape() {
  printf '%s' "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'
}

status=$(playerctl status 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

artist=$(escape "$artist")
title=$(escape "$title")

if [ "$status" = "Playing" ]; then
  if [ -n "$artist" ] && [ -n "$title" ]; then
    text="$artist - $title"
  elif [ -n "$title" ]; then
    text="$title"
  elif [ -n "$artist" ]; then
    text="$artist"
  else
    text="Playing Media"
  fi
  text="󰎈   $text"
elif [ "$status" = "Paused" ]; then
  if [ -n "$artist" ] && [ -n "$title" ]; then
    text="$artist - $title"
  elif [ -n "$title" ]; then
    text="$title"
  elif [ -n "$artist" ]; then
    text="$artist"
  else
    text="Media Paused"
  fi
  text="󰏤   (paused) $text"
else
  text="󰎈"
fi

echo "$text" | sed 's/\(.\{45\}\).*/\1.../'
