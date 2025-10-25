function fish_user_key_bindings
  bind alt-p "~/.config/scripts/tmux-sessionizer.sh; commandline -f repaint"
end

fzf --fish | source
