#
# ~/.bash_profile
# ~/.zprofile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.local/bin
# Home dir cleanup
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=/run/user/1000
#export XAUTHORITY=$XDG_DATA_HOME/Xauthority
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
#export XRESOURCES=$XDG_CONFIG_HOME/x11/Xresources
export XRESOURCES=$XDG_CONFIG_HOME/x11/hinotori
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export LESSHISTFILE=/dev/null
export HTOPRC=/dev/null
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export RANDFILE="$XDG_DATA_HOME/rnd"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Making vim XDGBD compliant
# https://blog.joren.ga/configuring/vim-xdg | Edited to fit this machine
## Make sure syntax highlighting is re-enabled: https://wiki.archlinux.org/index.php/vim#Syntax_highlighting
## ^^^ What?

#export VIMINIT='set nocp | source ${XDG_CONFIG_HOME}/vim/vimrc'
export MYVIMRC=$XDG_CONFIG_HOME/vim/vimrc
export VIMINIT='source $MYVIMRC'

# Preferent programs
#export MANPAGER="nvim -c 'set ft=man' -"
#export PAGER="nvim +Man\!"
export MANPAGER="nvim +Man\!"
#export MANPAGER="less"
export EDITOR=nvim
export VISUAL=nvim
export MOZ_ENABLE_WAYLAND=0
#export GTK_USE_PORTAL=0

# Personal variables
#export WALLS_DIR=$XDG_DATA_HOME/wallpaper-cp.jpg
export WALLS_DIR=$HOME/downs/wallpapers/reach.png
export LOCK_WALLPAPER=/tmp/lockwall.png

#🗀
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.heic=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.webp=:\
*.xspf=:\
*.ico=:\
*.pdf=:\
*.nix=:\
*.xml=:\
*.epub=󰂺:\
*.djvu=:\
*.docx=:\
*.doc=:\
*.odt=:\
*.ods=:\
*.xls=:\
*.xlsx=:\
*.tex=:\
*.txt=:\
*.ttf=:\
*.otf=:\
*.o=:\
*.mk=:\
*Makefile=:\
*LICENSE=:\
*.1=󰛼:\
*.diff=󰕚:\
*.rej=:\
*.orig=:\
*README=󰛼:\
*.bak=󰁯:\
*TODO=:\


"
#
#*vimrc=:\
#rss*.xml=:\

# Auto-login
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
#fi
