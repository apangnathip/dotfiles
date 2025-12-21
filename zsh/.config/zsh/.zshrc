if [ -z "$TMUX" ]; then
  exec tmux new-session -t ground
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.histfile
HISTCONTROL=ignoreboth
ZSH_AUTOSUGGEST_STRATEGY=(history completion) 

zmodload zsh/complist
autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz tetriscurses # must have 

zstyle ":completion:*" completer _extensions _complete _approximate
zstyle ":completion:*" menu select
zstyle ":completion:*" complete-options true
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-separator ''
zstyle ':completion:*:options' list-colors '=(#b)(-[^ -]#)#( [^-]*)=0=0=33'

setopt PUSHD_SILENT
setopt pushd_ignore_dups
setopt auto_pushd
setopt autocd
setopt extendedglob
setopt no_case_glob
setopt no_case_match
setopt globdots

alias sv=sudoedit
alias v=nvim
alias vim=nvim
alias ls="eza -F always"
alias la="eza -aF always"
alias ll="eza -alF always --git --icons=always --time-style=relative"
alias lt="eza -TF always --level=2"
alias tp="trashy put"

alias d="dirs -v | tail -n +2"
for index ({1..9}) alias "$index"="cd +${index}"; unset index

bindkey -e
bindkey -r "^[p"
bindkey -r "^[P"
bindkey -r "^[n"
bindkey -r "^[N"
bindkey "^[[1~" beginning-of-line
bindkey "^[[3~" delete-char
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history

tmux-sessionizer() { "$XDG_CONFIG_HOME/scripts/tmux-sessionizer.sh"; zle reset-prompt; }
zle -N tmux-sessionizer

bindkey "^[p" tmux-sessionizer 
bindkey "^f" autosuggest-accept
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

cursor_mode() {
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() { echo -ne $cursor_beam; }
    zle -N zle-keymap-select
    zle -N zle-line-init
}

source <(fzf --zsh)
source ~/.local/bin/powerlevel10k/powerlevel10k.zsh-theme; [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/bd/bd.zsh"

