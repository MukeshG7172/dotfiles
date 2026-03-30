#!/usr/bin/env bash

if command -v swaync-client >/dev/null 2>&1; then
  swaync-client -t
elif command -v dunstctl >/dev/null 2>&1; then
  dunstctl history-pop
fi
