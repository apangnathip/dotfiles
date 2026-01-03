#!/usr/bin/env bash

awk -F: '
  BEGIN {
    fg_esc="\033Ptmux;\033\033]10;%s\033\\"
    bg_esc="\033Ptmux;\033\033]11;[85]%s\033\\"
    col_esc="\033Ptmux;\033\033]4;%d;%s\033\\"
  }

  /^fg:/ { printf fg_esc, $2 > "/dev/tty" }
  /^bg:/ { printf bg_esc, $2 > "/dev/tty" }
  /^[0-9]+:/ { printf col_esc, $1, $2 > "/dev/tty" }

' <"/home/alpan/.config/foot/colors"
