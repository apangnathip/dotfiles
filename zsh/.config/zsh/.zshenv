export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"
export KEYTIMEOUT=1

export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude '.git'"
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '.git'. \$dir | sed 's#^\./##'"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude '.git'"
export FZF_DEFAULT_OPTS="--color=fg:-1,fg+:#d0d0d0,bg:-1,bg+:#281e30 
--color=hl:#52a8b3,hl+:#9ccfd8,info:#716779 
--color=prompt:#9ccfd8,spinner:#d0d0d0,pointer:#9ccfd8,
--color=gutter:#281e30,border:#281e30,separator:#281e30,label:#aeaeae 
--pointer=▌ --color=query:#d0d0d0 --layout=reverse"

eval $(dircolors)
