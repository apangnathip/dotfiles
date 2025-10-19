#!/usr/bin/env bash
# thanks, man of hoodies and man of magnificent hair

directories=(
  "$HOME"
  "$HOME/uni"
  "$HOME/proj"
  "$HOME/work"
)

while getopts "m" opt; do
  case $opt in
    m)
      margin=1;;
  esac
done
shift $((OPTIND -1))

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(fdfind -td -d1 . "${directories[@]}" |
    sed "s|^$HOME/||" |
    # fzf --margin 0,6 --height 50% --layout reverse)
    fzf ${margin:+--margin 0,6} --height 50% --layout reverse)

  if [[ -n $selected ]]; then
    selected="$HOME/$selected"
  fi
fi

if [[ ! $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if [[ ! $TMUX ]]; then
  tmux new-session -A -s "$selected_name" -c "$selected"
  exit 0
fi

if ! tmux has-session -t "$selected_name"; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t $selected_name
