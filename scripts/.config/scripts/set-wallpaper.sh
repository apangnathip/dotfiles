#!/usr/bin/env bash

wallpaper="${1:-/home/alpan/.config/wallpapers/sakura.jpg}"

wal -est -i "$wallpaper" --fg "#eeeeee"

xrdb ~/.Xresources
cp ~/.cache/wal/colors-discord.css ~/.config/vesktop/themes/pywal.css
pkill -SIGUSR2 ghostty
pgrep qutebrowser > /dev/null && qutebrowser :config-source
pgrep spotify > /dev/null && { spicetify watch -qs & pkill spicetify; }
awww img "$wallpaper" -a -t fade --transition-duration 0.25 
