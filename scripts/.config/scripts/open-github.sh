#!/usr/bin/env bash

cd $(tmux display-message -p "#{pane_current_path}")
url=$(git remote get-url origin 2>/dev/null)

if [ $? -eq 0 ]; then
  pwsh -c start $url
  echo "Successfully opened"
else
  echo "No remote found"
fi

