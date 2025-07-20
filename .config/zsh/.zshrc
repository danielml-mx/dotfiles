# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

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

# Unbind some control sequences (like freeze)
stty -ixon

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
			PROMPT='%{$fg[yellow]%}< %{$fg[white]%}%n%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[red]%}$(parse_git_branch)%{$fg[yellow]%} >│%{$reset_color%} '
		else
			# green
			PROMPT='%{$fg[yellow]%}< %{$fg[white]%}%n%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[green]%}$(parse_git_branch)%{$fg[yellow]%} >│%{$reset_color%} '
		fi
	else
		# nothing
		PROMPT='%{$fg[yellow]%}< %{$fg[white]%}%n%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[yellow]%} >│%{$reset_color%} '
		#PROMPT='%{$fg[red]%} %{$fg[white]%}root%{$fg[red]%}@%{$fg[white]%}archiso%{$fg[red]%} #%{$reset_color%} '
		#PROMPT='%{$fg[blue]%}< %{$fg[white]%}%n%{$fg[blue]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[blue]%} >│ '
		#PROMPT='%{$fg[red]%}< %{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%M %{$fg[red]%}%~%{$fg[red]%} >│%{$reset_color%} '
	fi
}
#PROMPT='%{$fg[yellow]%}< %{$fg[white]%}%n%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[green]%}$(parse_git_branch)%{$fg[yellow]%} >│%{$reset_color%} '

#PS1="%{$fg[yellow]%}< %{$fg[white]%}%n%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[yellow]%} >│%{$reset_color%} "
#PS1="%{$fg[yellow]%}< %{$fg[white]%}daniel%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[yellow]%} >│%{$reset_color%} "

#eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/config.toml)"

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


lfcd () {
    #printf '\033]2;lfub\a' > /dev/tty %N ;
    tmp="$(mktemp -uq)"
    #trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
    ~/.local/bin/lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	rm -f $tmp
    fi
    #printf '\033]2;Alacritty\a' > /dev/tty %N ;

}

yazicd () {
    tmp="$(mktemp -uq)"
    yazi --cwd-file="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	rm -f $tmp
    fi
    echo -ne "\033]0;st\007"
    #printf '\033]2;Alacritty\a' > /dev/tty %N ;
}


fcd() {
	cd "$( find -type d | fzf --reverse )"
}

open() {
	xdg-open-nobg "$( find -type f | fzf --reverse )"
}

cdopen() {
	fd="$( find | fzf --reverse )"
	#echo $fd
	#echo $(basename $fd)
	#[ $(file --mime-type -b $fd) = 'inode/directory' ] && echo "yes" && cd "$fd" || cd $(dirname "$fd") && xdg-open-nobg "$(basename $fd)"
	[ $(file --mime-type -b $fd) != 'inode/directory' ] && cd $(dirname "$fd") && xdg-open-nobg "$(basename $fd)" || cd "$fd"
}



bindkey -s '^s' '^ulfcd\n^l'
#bindkey -s '^w' '^uyazicd\n^l'
#bindkey -s '^g' '^ufcd\n^l'
#bindkey -s '^o' '^uopen\n^l'
bindkey -s '^o' '^ucdopen\n^l'
#bindkey -s '^h' '^ucd\n'
bindkey '^H' backward-kill-word
bindkey '^[[M' kill-word
#bindkey -s '^a' '^ulfcd\n'
#bindkey -s '^d' '^uclear && exit\n^l'
#alias exit="clear && logout"


# Comments in interactive mode
setopt interactivecomments

# Prompt-correct commands
setopt correct

#### My aliases ####
alias startx='cd && startx'
alias ls='ls --color=auto'
alias unrar='unrar-free'
alias bt="sudo bluetoothctl"
alias wifi="sudo wpa_cli status | grep ssid"
alias dots='/usr/bin/git --git-dir="$HOME/.config/.dotfile-manager" --work-tree="$HOME"' # add to rc

# USB management
#alias mountusb='mkdir ~/media/usb && mount -U CEA3-0E2D || rmdir ~/media/usb || echo "USB is already mounted."'
#alias umountusb='umount ~/usb && rmdir ~/usb'
#alias rusb='sudo umount ~/usb && rmdir ~/usb'
#alias mountcrypt='mkdir ~/Media/CryptUSB && mount /dev/mapper/cryptusb'
#alias umountcrypt='umount ~/Media/CryptUSB && rmdir ~/Media/CryptUSB'

# Safer rm
alias rm='rm -I '

# Quick commands
alias nv='nvim'
alias testwlp='ping archlinux.org' 		# Test wifi
alias cpcb='xclip -selection clipboard -r'		# Copy to clibpoard
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"
alias smci="sudo make clean install"
alias smi="sudo make install"
alias nmut="neomutt"
alias zath="zathura"
alias tec-otp="pass otp tec-otp | cpcb"
alias rD="rmdir D*"
#alias gccpp="gcc -lstdc++"
#alias webup="rsync -rzvP --exclude='6duj41uc_fn-ctrl-swap.iso' ~/downs/website/testsite/ root@danielml.xyz:/var/www/danielml"
alias webup="rsync -rzvP ~/downs/websites/danielml/public/ yo@192.168.1.160:/var/www/danielml"
alias webupext="rsync -rzvP ~/downs/websites/danielml/public/ yo@189.175.172.195:/var/www/danielml"
#"rsync -rzvP ~/downs/websites/danielml/public/ yo@192.168.1.160:/var/www/danielml"
alias webdown="rsync -rzvP --exclude='6duj41uc_fn-ctrl-swap.iso' root@danielml.xyz:/var/www/danielml/ ~/downs/website"
alias ev="$EDITOR ~/docs/personal/improvement/eval/$( date +%Y)/eval"
alias trm='transmission-remote'
#alias neofetch='neofetch --no_config --ascii_colors 4 4 4 4 4 4 --colors 4 4 4 4 4 15'
alias neofetch='neofetch --no_config --ascii_colors 11 11 11 11 11 11 --colors 11 11 11 11 11 15'
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
alias lw="librewolf"
alias 2..="cd ../.."
alias 3..="cd ../../.."
alias 4..="cd ../../../.."
alias 5..="cd ../../../../.."
alias 6..="cd ../../../../../.."
alias 7..="cd ../../../../../../.."
alias 8..="cd ../../../../../../../.."
alias 9..="cd ../../../../../../../../.."
alias 10..="cd ../../../../../../../../../.."
alias hss="hugo server --noHTTPCache --disableFastRender"
alias ktd='killall transmission-daemon'

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
alias wrc="$EDITOR $XDG_CONFIG_HOME/hypr/hyprland.conf"
alias mrc="$EDITOR ~/.config/mutt/muttrc"
alias prc="$EDITOR ~/.config/picom/picom.conf"
alias dunstrc="$EDITOR ~/.config/dunst/dunstrc"
#alias picom="picom --experimental-backends"	# for jonaburg's fork
alias polyrc="$EDITOR ~/.config/polybar/config"
alias picomrc="$EDITOR ~/.config/picom/picom.conf"
alias hyprrc="$EDITOR ~/.config/hypr/hyprland.conf"

# Make programs cleaner and force them to use less cache
alias sxiv='sxiv -p -a'
alias wget='wget --hsts-file=/dev/null'
alias cvim='sudo vim --clean'
alias td='transmission-daemon --download-dir "/home/$USER/downs/torrents" --no-incomplete-dir'

# Other
alias dotfiles='/usr/bin/git --git-dir="$HOME/.config/.dotfile-manager" --work-tree="$HOME"'

# Force XDG Dir. compliance
alias mbsync="mbsync -c '$XDG_CONFIG_HOME'/isync/mbsyncrc"
alias monerod="monerod --data-dir '$XDG_DATA_HOME'/bitmonero"
#alias monero-wallet-cli="monero-wallet-cli --wallet-file ~/.local/share/monero-wallet/monero-wallet --shared-ringdb-dir $XDG_STATE_HOME/shared-ringdb --log-file ~/.cache/monero-wallet-cli.log"
alias monero-wallet-cli="monero-wallet-cli --wallet-file ~/.local/share/monero-wallet/monero-wallet --shared-ringdb-dir /dev/null --log-file ~/.cache/monero-wallet-cli.log"

# Autosuggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
zstyle ':completion:*' ignored-patterns 'nvidia*|'	# ignore certain patterns
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# changed ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh line 36 from color 8 to 7 
source ~/.zprofile

# Theme
'builtin' 'local' '-a' '__p9k_src_opts'
[[ ! -o 'aliases'         ]] || __p9k_src_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || __p9k_src_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || __p9k_src_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

(( $+__p9k_root_dir )) || typeset -gr __p9k_root_dir=${POWERLEVEL9K_INSTALLATION_DIR:-${${(%):-%x}:A:h}}
(( $+__p9k_intro )) || {
  # Leading spaces before `local` are important. Otherwise Antigen will remove `local` (!!!).
  # __p9k_trapint is to work around bugs in zsh: https://www.zsh.org/mla/workers/2020/msg00612.html.
  # Likewise for `trap ":"` instead of the plain `trap ""`.
  typeset -gr __p9k_intro_base='emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH OPTARG IFS=$'\'' \t\n\0'\'
  typeset -gr __p9k_intro_locale='[[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]] && _p9k_init_locale && { [[ -n $LC_ALL ]] && local LC_ALL=$__p9k_locale || local LC_CTYPE=$__p9k_locale }'
  typeset -gr __p9k_intro_no_locale="${${__p9k_intro_base/ match / match reply }/ MATCH / MATCH REPLY }"
  typeset -gr __p9k_intro_no_reply="$__p9k_intro_base; $__p9k_intro_locale"
  typeset -gr __p9k_intro="$__p9k_intro_no_locale; $__p9k_intro_locale"
}

zmodload zsh/langinfo

function _p9k_init_locale() {
  if (( ! $+__p9k_locale )); then
    typeset -g __p9k_locale=
    (( $+commands[locale] )) || return
    local -a loc
    loc=(${(@M)$(locale -a 2>/dev/null):#*.(utf|UTF)(-|)8}) || return
    (( $#loc )) || return
    typeset -g __p9k_locale=${loc[(r)(#i)C.UTF(-|)8]:-${loc[(r)(#i)en_US.UTF(-|)8]:-$loc[1]}}
  fi
  [[ -n $__p9k_locale ]]
}

() {
  eval "$__p9k_intro"
  if (( $+__p9k_sourced )); then
    (( $+functions[_p9k_setup] )) && _p9k_setup
    return 0
  fi
  typeset -gr __p9k_dump_file=${XDG_CACHE_HOME:-~/.cache}/p10k-dump-${(%):-%n}.zsh
  if [[ $__p9k_dump_file != $__p9k_instant_prompt_dump_file ]] && (( ! $+functions[_p9k_preinit] )) && source $__p9k_dump_file 2>/dev/null && (( $+functions[_p9k_preinit] )); then
    _p9k_preinit
  fi
  typeset -gr __p9k_sourced=13
  if [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]]; then
    if [[ -w $__p9k_root_dir && -w $__p9k_root_dir/internal && -w $__p9k_root_dir/gitstatus ]]; then
      local f
      for f in $__p9k_root_dir/{powerlevel9k.zsh-theme,powerlevel10k.zsh-theme,internal/p10k.zsh,internal/icons.zsh,internal/configure.zsh,internal/worker.zsh,internal/parser.zsh,gitstatus/gitstatus.plugin.zsh,gitstatus/install}; do
        [[ $f.zwc -nt $f ]] && continue
        zmodload -F zsh/files b:zf_mv b:zf_rm
        local tmp=$f.tmp.$$.zwc
        {
          # `zf_mv -f src dst` fails on NTFS if `dst` is not writable, hence `zf_rm`.
          zf_rm -f -- $f.zwc && zcompile -R -- $tmp $f && zf_mv -f -- $tmp $f.zwc
        } always {
          (( $? )) && zf_rm -f -- $tmp
        }
      done
    fi
  fi
  builtin source $__p9k_root_dir/internal/p10k.zsh || true
}

(( $+__p9k_instant_prompt_active )) && unsetopt prompt_cr prompt_sp || setopt prompt_cr prompt_sp

(( ${#__p9k_src_opts} )) && setopt ${__p9k_src_opts[@]}
'builtin' 'unset' '__p9k_src_opts'

#pfetch

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
