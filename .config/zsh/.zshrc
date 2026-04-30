#created by newuser for 5.8
#
## used to be ~/.bashrc
## now ~/.zshrc
##
#
## If not running interactively, don't do anything
##[[ $- != *i* ]] && return
#
##PS1='[\u@\h \W]\$ '


#### General ####

# Colors 
#source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
autoload -U colors && colors


# Git branch indicator
# https://stackoverflow.com/questions/1128496/to-get-a-prompt-which-indicates-git-branch-in-zsh
parse_git_branch() 
{
    #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    git symbolic-ref --short HEAD 2> /dev/null | sed -e 's/.*/ (&)/'
}

setopt PROMPT_SUBST
#PROMPT='%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} $ '

# Not even entirely sure how it works.
# In theory prompts green when git status is clean,
# red when git status is not clean.
# https://stackoverflow.com/questions/34602033/colorize-git-branch-name-depending-of-the-state-using-vcs-info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:git*:*' get-revision true
#zstyle ':vcs_info:git*:*' check-for-changes true
#
##zstyle ':vcs_info:*' stagedstr '%F{3}A%f' 
#zstyle ':vcs_info:*' stagedstr '%F{3}A%f' 
#zstyle ':vcs_info:*' unstagedstr 'M' 
#zstyle ':vcs_info:*' actionformats '%f(%F{2}%b%F{3}|%F{1}%a%f)  '
## format the git part
#zstyle ':vcs_info:*' formats '%f(%b) %F{2}%c%F{3}%u%m%f'
#zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-stash git-st
#zstyle ':vcs_info:*' enable git 
#zstyle ':vcs_info:*+*:*' debug true

#precmd() {
#	vcs_info
#	if [[ -n ${vcs_info_msg_0_} ]]; then
#		STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
#		if [[ -n $STATUS ]]; then
#			# red
#			PROMPT='%{$fg[magenta]%}< %{$fg[white]%}%n%{$fg[magenta]%}@%{$fg[white]%}%M %{$fg[magenta]%}%~%{$fg[red]%}$(parse_git_branch)%{$fg[magenta]%} >│%{$reset_color%} '
#		else
#			# green
#			PROMPT='%{$fg[magenta]%}< %{$fg[white]%}%n%{$fg[magenta]%}@%{$fg[white]%}%M %{$fg[magenta]%}%~%{$fg[green]%}$(parse_git_branch)%{$fg[magenta]%} >│%{$reset_color%} '
#		fi
#	else
#		# nothing
#		PROMPT='%{$fg[magenta]%}< %{$fg[white]%}%n%{$fg[magenta]%}@%{$fg[white]%}%M %{$fg[magenta]%}%~%{$fg[magenta]%} >│%{$reset_color%} '
#	fi
#}
precmd() {
	vcs_info
	if [[ -n ${vcs_info_msg_0_} ]]; then
		STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
		if [[ -n $STATUS ]]; then
			# red
			PROMPT='%{$fg[blue]%}< %{$fg[white]%}%n%{$fg[blue]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[red]%}$(parse_git_branch)%{$fg[blue]%} >│%{$reset_color%} '
		else
			# green
			PROMPT='%{$fg[blue]%}< %{$fg[white]%}%n%{$fg[blue]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[green]%}$(parse_git_branch)%{$fg[blue]%} >│%{$reset_color%} '
		fi
	else
		# nothing
		PROMPT='%{$fg[blue]%}< %{$fg[white]%}%n%{$fg[blue]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[blue]%} >│%{$reset_color%} '
		#PROMPT='%{$fg[blue]%}< %{$fg[white]%}%n%{$fg[blue]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[blue]%} >│ '
		#PROMPT='%{$fg[red]%}< %{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%M %{$fg[red]%}%~%{$fg[red]%} >│%{$reset_color%} '
	fi
}
#PROMPT='%{$fg[yellow]%}< %{$fg[white]%}%n%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[green]%}$(parse_git_branch)%{$fg[yellow]%} >│%{$reset_color%} '

#PS1="%{$fg[yellow]%}< %{$fg[white]%}%n%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[yellow]%} >│%{$reset_color%} "
#PS1="%{$fg[yellow]%}< %{$fg[white]%}daniel%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[yellow]%} >│%{$reset_color%} "


# Cache dir, XDG compliant
HISTSIZE=100
SAVEHIST=100
HISTFILE=$XDG_DATA_HOME/zsh/history

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'	# Case-insensitive matching

# Vimkeys in autocomplete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Vi/Vim keybindings
set -o vi
bindkey -v
#set backspace=indent,eol,start
bindkey -v '^?' backward-delete-char # See https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode

# Home/Ins/End/Del (st exclusive)
bindkey  "\033[H"   	beginning-of-line
bindkey  "\033[4~"   	end-of-line
bindkey  "^[[3~"  	delete-char
bindkey	 "\033[4h"	insert-char
bindkey  "\033[1;5C"	forward-word
bindkey  "\033[1;5D"	backward-word
bindkey  "\033[3;5~"	delete-word
#bindkey  "^Y"		undefined-key
#bindkey  "^Z"		undo
#bindkey  "^R"		redo
# TODO: bindkey 5C next word / previous word

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# New term in same directory
nst()
{
	nohup st > /dev/null & 
}

bindkey -s '^t' '^unst\n^l'

lfcd () {
    tmp="$(mktemp -uq)"
    #trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
    ~/.local/bin/lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	rm -f $tmp
    fi
}

fcd() {
	cd "$( find -type d | fzf )"
}

open() {
	xdg-open "$( find -type f | fzf )"
}


bindkey -s '^w' '^ulfcd\n^l'
bindkey -s '^g' '^ufcd\n^l'
bindkey -s '^o' '^uopen\n^l'
#bindkey -s '^h' '^ucd\n'
bindkey '^H' backward-kill-word
bindkey '^[[M' kill-word
#bindkey -s '^a' '^ulfcd\n'
#bindkey -s '^d' '^uclear && exit\n^l'
#alias exit="clear && logout"




# This is used for lf
# basically what I wanted is that whenever I
# open up the interactive shell and then exit it
# in a different directory, put me (in lf) there,
# not the original directory from which I opened it.
#trap 'pwd > /tmp/lf.$USER.lastdir' EXIT

# Comments in interactive mode
setopt interactivecomments

# Prompt-correct commands
setopt correct

#### My aliases ####
alias startx='cd && startx'
alias ls='ls --color=auto'
alias unrar='unrar-free'
# Rewrite st title after quitting certain programs
alias cmus='cmus &&  echo -ne "\033]0;st\007"'
alias ranger='ranger && echo -ne "\033]0;st\007"'
alias lf='lf && echo -ne "\033]0;st\007"'
alias pulsemixer='pulsemixer && echo -ne "\033]0;st\007"'

# USB management
alias mountusb='mkdir ~/media/usb && mount -U CEA3-0E2D || rmdir ~/media/usb || echo "USB is already mounted."'
alias umountusb='umount ~/media/usb && rmdir ~/media/usb'
#alias mountcrypt='mkdir ~/Media/CryptUSB && mount /dev/mapper/cryptusb'
#alias umountcrypt='umount ~/Media/CryptUSB && rmdir ~/Media/CryptUSB'

# Safer rm
alias rm='rm -I '

# Quick commands
alias testwlp='ping archlinux.org' 		# Test wifi
alias cpcb='xclip -selection clipboard -r'		# Copy to clibpoard
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"
alias way="dwl -s './.wayland <&-'"
alias smci="sudo make clean install"
alias smi="sudo make install"
alias nmut="neomutt"
alias zath="zathura"
alias tec-otp="pass otp tec-otp | cpcb"
alias rD="rmdir D*"
#alias gccpp="gcc -lstdc++"
alias webup="rsync -rzvP --exclude='6duj41uc_fn-ctrl-swap.iso' ~/downs/website/ root@danielml.xyz:/var/www/danielml"
#alias webup="rsync -rzvP --exclude='6duj41uc_fn-ctrl-swap.iso' ~/downs/website/testsite/ root@danielml.xyz:/var/www/danielml"
alias webdown="rsync -rzvP --exclude='6duj41uc_fn-ctrl-swap.iso' root@danielml.xyz:/var/www/danielml/ ~/downs/website"
alias ev="$EDITOR ~/docs/personal/improvement/eval/$( date +%Y)/eval"
alias trm='transmission-remote'
alias neofetch='neofetch --no_config --ascii_colors 4 4 4 4 4 4 --colors 4 4 4 4 4 15'
#alias newtex=""
alias ag="cd ~/docs/personal/archguides"
alias sdcv="sdcv -c"
alias def="sdcv -c -u \"Oxford Advanced Learner's Dictionary 8th Ed.\""
alias en-es="sdcv -c -u 'quick_english-spanish'"
alias es-en="sdcv -c -u 'Spanish - English'"
alias en-la="sdcv -c -u 'English - Latin'"
alias la-en="sdcv -c -u 'Latin - English'"
alias de-en="sdcv -c -u 'German-English dictionary'"
alias rwp="sudo rc-service wpa_supplicant restart"
alias lf="~/.local/bin/lfub"
alias gcl="git clone"
alias zbarimg="zbarimg -q --raw"
alias getpath="find -type f | fzf | sed 's/^..//' | xclip -selection c -r"
alias 2..="cd ../.."
alias 3..="cd ../../.."
alias 4..="cd ../../../.."
alias 5..="cd ../../../../.."
alias 6..="cd ../../../../../.."
alias 7..="cd ../../../../../../.."
alias 8..="cd ../../../../../../../.."
alias 9..="cd ../../../../../../../../.."
alias 10..="cd ../../../../../../../../../.."

# Configs
alias vrc="$EDITOR ~/.config/vim/vimrc"
alias dwmrc="cd ~/downs/repos/suckless/dwm && $EDITOR config.def.h && sudo cp config.def.h config.h && smci"
alias dwmcd="cd ~/downs/repos/suckless/dwm"
alias stc="cd ~/downs/repos/suckless/st && $EDITOR config.def.h"
alias zrc="$EDITOR $ZDOTDIR/.zshrc && source $ZDOTDIR/.zshrc"
alias zp="$EDITOR ~/.zprofile && source ~/.zprofile"
alias lfrc="$EDITOR ~/.config/lf/lfrc"
alias cdw="cd ~/downs/website/aa-live"
alias xres="$EDITOR $XRESOURCES && xrdb $XRESOURCES"
alias xrc="$EDITOR ~/.xinitrc"
alias mrc="$EDITOR ~/.config/mutt/muttrc"
alias prc="$EDITOR ~/.config/picom/picom.conf"
alias dunstrc="$EDITOR ~/.config/dunst/dunstrc"
alias polyrc="$EDITOR ~/.config/polybar/config"
alias picomrc="$EDITOR ~/.config/picom/picom.conf"

# Make programs cleaner and force them to use less cache
alias sxiv='sxiv -p'
alias wget='wget --hsts-file=/dev/null'
alias cvim='sudo vim --clean'
alias td='transmission-daemon --download-dir "/home/daniel/downs/torrents" --no-incomplete-dir'
alias ktd='killall transmission-daemon'

# Other


# Force XDG Dir. compliance
alias mbsync="mbsync -c '$XDG_CONFIG_HOME'/isync/mbsyncrc"
alias monerod="monerod --data-dir '$XDG_DATA_HOME'/bitmonero"
#alias monero-wallet-cli="monero-wallet-cli --wallet-file ~/.local/share/monero-wallet/monero-wallet --shared-ringdb-dir $XDG_STATE_HOME/shared-ringdb --log-file ~/.cache/monero-wallet-cli.log"
alias monero-wallet-cli="monero-wallet-cli --wallet-file ~/.local/share/monero-wallet/monero-wallet --shared-ringdb-dir /dev/null --log-file ~/.cache/monero-wallet-cli.log"

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# changed ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh line 36 from color 8 to 7 
source ~/.zprofile
