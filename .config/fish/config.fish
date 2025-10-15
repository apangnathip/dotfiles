if status is-interactive
and not set -q TMUX
  exec tmux new-session -A -s 0 
end

starship init fish | source

set -gx PATH /usr/libexec/gcc/x86_64-linux-gnu/14/cc1 /home/alpan/.nvm/versions/node/v20.9.0/bin /home/alpan/.local/bin "/mnt/c/Users/alpan/AppData/Local/Programs/Microsoft VS Code/bin" $PATH
set fish_color_valid_path

# VI MODE STUFF
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
bind --mode insert --sets-mode default jk repaint

alias bat="batcat"
alias vim="nvim"
alias win="~/symlink/explorer.exe"
alias ls="eza -l --no-user --git --icons=always --no-time --no-permissions"
alias ll="eza -l --git --icons=always --time-style=relative"
alias la="eza -l --all --git --icons=always --time-style=relative"
alias lt="eza -T --level=3"
alias swi="rlwrap swipl"

fzf_configure_bindings --directory=\e\cf --variables=\e\cv

zoxide init fish | source

set shell_counter (ps a | awk '{print $5}' | grep "\-fish" | wc -l)
if test "$shell_counter" = 1
  echo
  fastfetch
end
