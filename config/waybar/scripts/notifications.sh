#!/usr/bin/env bash

if ! command -v swaync-client >/dev/null 2>&1; then
  echo '{"text":"󰂚","tooltip":"notifications unavailable","class":"empty"}'
  exit 0
fi

count=$(swaync-client -c)
dnd=$(swaync-client -D)

if [ "$dnd" = "true" ]; then
  echo '{"text":"󰂛","tooltip":"Do Not Disturb","class":"dnd"}'
  exit 0
fi

if [ "$count" -gt 0 ]; then
  echo "{\"text\":\"󰂚 $count\",\"tooltip\":\"$count notifications\",\"class\":\"notification\"}"
else
  echo '{"text":"󰂚","tooltip":"No notifications","class":"empty"}'
fi
