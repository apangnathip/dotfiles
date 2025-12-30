if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.histfile
HISTCONTROL=ignoreboth
ZSH_AUTOSUGGEST_STRATEGY=(history completion) 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=248"

eval $(dircolors)
zmodload zsh/complist
autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz edit-command-line && zle -N edit-command-line
autoload -Uz tetriscurses # must have 

zstyle ":completion:*" completer _extensions _complete _approximate
zstyle ":completion:*" menu no
zstyle ":completion:*" complete-options true
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ":completion:*:git-checkout:*" sort false

zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" list-separator ""
zstyle ":completion:*:options" list-colors "=(#b)(-[^ -]#)#( [^-]*)=0=0=33"
zstyle ":completion:*:descriptions" format "[%d]"

setopt PUSHD_SILENT
setopt pushd_ignore_dups
setopt auto_pushd
setopt autocd
setopt extendedglob
setopt no_case_glob
setopt no_case_match
setopt globdots

alias cat=bat
alias sv=sudoedit
alias v=nvim
alias vim=nvim
alias ls="eza -F always"
alias la="eza -aF always"
alias ll="eza -alF always --git --icons=always --time-style=relative"
alias lt="eza -TF always --level=3"
alias tp="trashy put"
alias land="test -z $TMUX && exec tmux new-session -t ground"

alias d="dirs -v | tail -n +2"
for index ({1..9}) alias "$index"="cd +${index}"; unset index

tmux-sessionizer() { "$XDG_CONFIG_HOME/scripts/tmux-sessionizer.sh"; zle reset-prompt; }
zle -N tmux-sessionizer

bindkey -e
bindkey -r "^[p"
bindkey -r "^[P"
bindkey -r "^[n"
bindkey -r "^[N"
bindkey "^[[1~" beginning-of-line
bindkey "^[[3~" delete-char
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history
bindkey "^[p" tmux-sessionizer 
bindkey "^f" autosuggest-accept
bindkey "^X^E" edit-command-line

source <(fzf --zsh)
source ~/.local/bin/powerlevel10k/powerlevel10k.zsh-theme; [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/bd/bd.zsh"

zstyle ":fzf-tab:complete:cd:*" fzf-preview "eza -1 --color=always $realpath"
zstyle ":fzf-tab:*" --bind=tab:accept
zstyle ":fzf-tab:*" use-fzf-default-opts yes
zstyle ":fzf-tab:*" switch-group "<" ">"
