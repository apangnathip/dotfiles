if status is-interactive
and not set -q TMUX
  exec tmux
end

starship init fish | source

set PATH /home/alpan/.nvm/versions/node/v20.9.0/bin $PATH /home/alpan/.local/bin
set -U fish_greeting
set fish_color_valid_path

# VI MODE STUFF
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
bind --mode insert --sets-mode default jk repaint

alias bat="batcat"
alias vim="nvim"
alias ls="eza -l --no-user --git --icons=always --no-time --no-permissions"
alias ll="eza -l --git --icons=always --time-style=relative"
alias la="eza -l --all -G --git --icons=always --time-style=relative"
alias lt="eza -T --level=3"

fzf_configure_bindings --directory=\e\cf --variables=\e\cv

zoxide init fish | source
