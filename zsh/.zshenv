export XDG_CONFIG_HOME="$HOME/.config"
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export VISUAL="nvim"
export KEYTIMEOUT=1
export PATH=$HOME/.local/bin:$PATH

export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude '.git'"
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '.git'. \$dir | sed 's#^\./##'"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude '.git' --exclude node_modules"
export FZF_DEFAULT_OPTS="                   \
    --pointer=▌ --layout=reverse            \
    --color fg:-1,fg+:15,bg:-1,bg+:-1       \
    --color hl:2,hl+:2,info:6               \
    --color prompt:2,spinner:1,pointer:8    \
    --color gutter:0,separator:0,scrollbar:0"
