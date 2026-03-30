#!/bin/sh

escape() {
  printf '%s' "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'
}

status=$(playerctl status 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

artist=$(escape "$artist")
title=$(escape "$title")

[ -z "$status" ] && exit 0

text="$artist - $title"

case "$status" in
  Playing) ;;
  Paused) text="(paused) $text" ;;
  *) exit 0 ;;
esac

echo "$text" | sed 's/\(.\{50\}\).*/\1.../'
