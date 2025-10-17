starship init fish | source

set -gx PATH /opt/nvim-linux-x86_64/bin /usr/libexec/gcc/x86_64-linux-gnu/14/cc1 /home/alpan/.nvm/versions/node/v20.9.0/bin /home/alpan/.local/bin "/mnt/c/Users/alpan/AppData/Local/Programs/Microsoft VS Code/bin" $PATH
set fish_color_valid_path
set --global nvm_data ~/.nvm/versions/node 
set fish_cursor_default line 

alias bat="batcat"
alias vim="nvim"
alias vi="nvim"
alias win="~/.symlink/explorer.exe"
alias ls="eza -l --no-user --git --icons=always --no-time --no-permissions"
alias ll="eza -l --git --icons=always --time-style=relative"
alias la="eza -l --all --git --icons=always --time-style=relative"
alias lt="eza -T --level=3"
alias swi="rlwrap swipl"

function sessionizer
    ~/.config/scripts/tmux-sessionizer.sh
    # commandline -f repaint
end

bind \ef sessionizer 

set shell_counter (ps a | awk '{print $5}' | grep "\-fish" | wc -l)
if test "$shell_counter" = 1
  fastfetch
end

