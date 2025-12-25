export XDG_CONFIG_HOME="$HOME/.config"
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export VISUAL="nvim"
export KEYTIMEOUT=1
export PATH=$HOME/.local/bin:$PATH

export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude '.git'"
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '.git'. \$dir | sed 's#^\./##'"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude '.git'"
export FZF_DEFAULT_OPTS="--pointer=▌ --layout=reverse"

source "${HOME}/.cache/wal/colors.sh"
eval $(dircolors)
