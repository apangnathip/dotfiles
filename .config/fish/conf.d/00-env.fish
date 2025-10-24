# set fish_cursor_default lineku 
# set fish_color_valid_path

set -g nvm_data ~/.nvm/versions/node 
set -gx PATH /opt/nvim-linux-x86_64/bin /usr/libexec/gcc/x86_64-linux-gnu/14/cc1 /home/alpan/.nvm/versions/node/v20.9.0/bin /home/alpan/.local/bin "/mnt/c/Users/alpan/AppData/Local/Programs/Microsoft VS Code/bin" $PATH
set -gx MANPAGER "nvim +Man!"

set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --follow --exclude '.git'"
set -gx FZF_CTRL_T_COMMAND "fd --type f --hidden --follow --exclude '.git'. \$dir | sed 's#^\./##'"
set -gx FZF_ALT_C_COMMAND "fd --type d --strip-cwd-prefix --hidden --follow --exclude '.git'"
set -gx FZF_DEFAULT_OPTS "--color=fg:-1,fg+:#d0d0d0,bg:-1,bg+:#281e30 
--color=hl:#52a8b3,hl+:#9ccfd8,info:#716779 
--color=prompt:#9ccfd8,spinner:#d0d0d0,pointer:#9ccfd8,
--color=gutter:#281e30,border:#281e30,separator:#281e30,label:#aeaeae 
--pointer=▌ --color=query:#d0d0d0 --layout=reverse"
