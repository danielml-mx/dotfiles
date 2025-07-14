#
# ~/.bash_profile
# ~/.zprofile
#

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.local/bin


#export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.local/bin:$HOME/.local/share/python/bin

# Home dir cleanup
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=/run/user/1000
#export XAUTHORITY=$XDG_DATA_HOME/Xauthority
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
#export XRESOURCES=$XDG_CONFIG_HOME/x11/Xresources
export XRESOURCES=$XDG_CONFIG_HOME/x11/$USER
#export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
#export GTK2_THEME=Graphite
export GTK2_RC_FILES=$XDG_DATA_HOME/themes/Graphite-Dark/gtk-2.0/gtkrc
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export LESSHISTFILE=/dev/null
export HTOPRC=/dev/null
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export RANDFILE="$XDG_DATA_HOME/rnd"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHON_HISTORY=$XDG_STATE_HOME/python/history
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export R_LIBS_USER="$XDG_DATA_HOME/r"
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# Making vim XDGBD compliant
# https://blog.joren.ga/configuring/vim-xdg | Edited to fit this machine
## Make sure syntax highlighting is re-enabled: https://wiki.archlinux.org/index.php/vim#Syntax_highlighting
## ^^^ What?

#export VIMINIT='set nocp | source ${XDG_CONFIG_HOME}/vim/vimrc'
export MYVIMRC=$XDG_CONFIG_HOME/vim/vimrc
export VIMINIT='source $MYVIMRC'

# Other settings for programs
#export MOZ_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=0
export MOZ_USE_XINPUT2=1

# Preferent programs
export TERMCMD="st"
export MANPAGER="nvim +Man\!"
export EDITOR=nvim
export VISUAL=nvim
#export GTK_USE_PORTAL=0


# Personal variables
export WALLS_DIR=$HOME/downs/wallpapers/my_lion.png
export LOCK_WALLPAPER=/tmp/lockwall.png

# Temporary sioyek fix
export QT_QPA_PLATFORM=xcb
