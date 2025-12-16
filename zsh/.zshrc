if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.histfile
HISTCONTROL=ignoreboth

bindkey -e

autoload -Uz compinit && compinit

# zstyle :compinstall filename '/home/alpan/.zshrc'
# zstyle ':completion:*' menu select # tab opens cmp menu
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
# zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

setopt autocd
setopt extendedglob

alias vim=nvim
alias ls="eza"
alias la="eza -a"
alias ll="eza -l --no-user --all --git --icons=always --time-style=relative"
alias lt="eza -T --level=2"

source ~/.local/bin/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
