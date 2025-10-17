#!/usr/bin/env bash

# thanks, man of hoodies and man of magnificent hair

directories=(
  "$HOME"
  "$HOME/uni"
  "$HOME/proj"
  "$HOME/work"
)

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(fdfind -td -d1 . "${directories[@]}" |
    sed "s|^$HOME/||" |
    fzf --margin 0,6 --height 50% --layout reverse)

  [[ "$selected" ]] && selected="$HOME/$selected"
fi

[[ -z $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
tmux new-session -A -s "$selected_name" -c "$selected"
tmux switch-client -t $selected_name
