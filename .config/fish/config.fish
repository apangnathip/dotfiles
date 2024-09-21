if status is-interactive
and not set -q TMUX
  exec tmux
end

starship init fish | source

set PATH /home/alpan/.nvm/versions/node/v20.9.0/bin $PATH
set -U fish_greeting
set fish_color_valid_path

# VI MODE STUFF
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
bind --mode insert --sets-mode default jk repaint

alias vim="nvim"
alias ls="exa"
alias ll="exa --long"
alias la="exa --long --all"
alias lt="exa --tree --level=3"
