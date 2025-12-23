#!/usr/bin/env bash

wallpaper="${1:-/home/alpan/.config/wallpapers/sakura.jpg}"

wal -est -i "$wallpaper" --fg "#eeeeee"

cp ~/.cache/wal/colors-discord.css ~/.config/vesktop/themes/pywal.css
pkill -SIGUSR2 ghostty
qutebrowser :config-source

while ! pgrep awww > /dev/null; do
  sleep 0.1
done

awww img "$wallpaper" -a -t fade --transition-duration 0.25 

