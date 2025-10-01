## ~/.zshrc

## If not running interactively, don't do anything
[[ $- != *i* ]] && return


#### Startup commands ####

# Custom text for terminal title
# (filter '-256color')
cTERM=$( echo $TERM | sed "s/\-256color//g")
echo -ne "\033]0;$(pwd) - $cTERM\007"


#### Preferences ####

# Cache dir, XDG compliant
HISTSIZE=100
SAVEHIST=100
HISTFILE=$XDG_DATA_HOME/zsh/history

# Comments in interactive mode
setopt interactivecomments

# Prompt-correct commands
setopt correct

# Enable completion for aliases
setopt completealiases

#### Keybindings ####

# Unbind some control sequences (like freeze)
stty -ixon

# Vi/Vim keybindings
set -o vi
# See https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
bindkey -v '^?' backward-delete-char

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

# Home/Ins/End/Del (st exclusive [maybe])
bindkey  "\033[H"   	beginning-of-line
bindkey  "\033[4~"   	end-of-line
bindkey  "^[[3~"  	delete-char
bindkey	 "\033[4h"	insert-char
bindkey  "\033[1;5C"	forward-word
bindkey  "\033[1;5D"	backward-word
bindkey  "\033[3;5~"	delete-word

# Ctrl + [Back/Del] deletes the entire word
bindkey '^H' backward-kill-word
bindkey '^[[M' kill-word


#### Custom functions ####

# update terminal title after every cd
# https://joshtronic.com/2022/02/27/how-to-run-a-command-after-changing-directories-in-zsh/
function cd {
	builtin cd "$@" && echo -ne "\033]0;$(pwd) - $cTERM\007"
}

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

# Use lf and drop into dir when quitting, also redraw title
# to match location.
lfcd () {
    tmp="$(mktemp -uq)"
    ~/.local/bin/lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	rm -f $tmp
    fi
    echo -ne "\033]0;$(pwd) - $cTERM\007"
}

# Same for yazi (currently unused)
yazicd () {
    tmp="$(mktemp -uq)"
    yazi --cwd-file="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	rm -f $tmp
    fi
    echo -ne "\033]0;$(pwd) - $cTERM\007"
}

# Use fzf to open files/change into dirs
cdopen() {
	fd="$( find | fzf --reverse )"
	[ $(file --mime-type -b $fd) != 'inode/directory' ] && cd $(dirname "$fd") && xdg-open-nobg "$(basename $fd)" || cd "$fd"
	echo -ne "\033]0;$(pwd) - $cTERM\007"
}

# Bind previous functions to keys
bindkey -s '^o' '^ucdopen\n^l'
bindkey -s '^s' '^ulfcd\n^l'


#### Aliases ####

# Safer rm + prettier ls
alias rm='rm -I '
alias ls='ls --color=auto'

# startx always from $HOME
alias startx='cd && startx'

# Dotfile manager
alias dots='/usr/bin/git --git-dir="$HOME/.config/.dotfile-manager" --work-tree="$HOME"'

# Quick commands
alias nv='nvim'
alias cpcb='xclip -selection clipboard -r'
alias nmut="neomutt"
alias zath="zathura"
alias rD="rmdir D*"
alias trm='transmission-remote'
alias neofetch='neofetch --no_config --ascii_colors 11 11 11 11 11 11 --colors 11 11 11 11 11 15'
alias sdcv="sdcv -c"
alias def="sdcv -c -u \"Oxford Advanced Learner's Dictionary 8th Ed.\""
alias en-es="sdcv -c -u 'quick_english-spanish'"
alias es-en="sdcv -c -u 'Spanish - English'"
alias en-la="sdcv -c -u 'English - Latin'"
alias la-en="sdcv -c -u 'Latin - English'"
alias de-en="sdcv -c -u 'German-English dictionary'"
alias lf="~/.local/bin/lfub"
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
alias hnc="hugo new content"
alias ktd='killall transmission-daemon'
alias unrar='unrar-free'
# Make programs cleaner and force them to use less cache
alias sxiv='sxiv -p -a'
alias wget='wget --hsts-file=/dev/null'
alias td='transmission-daemon --download-dir "/home/$USER/downs/torrents" --no-incomplete-dir'
alias zbarimg="zbarimg -q --raw"
# sudo-allowed commands
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"
alias smci="sudo make clean install"
alias smi="sudo make install"
alias wifi="sudo wpa_cli status | grep ssid"
alias cvim='sudo vim --clean'

# Open configs
alias zrc="$EDITOR $ZDOTDIR/.zshrc && source $ZDOTDIR/.zshrc"
alias zp="$EDITOR ~/.zprofile && source ~/.zprofile"
alias xrc="$EDITOR ~/.xinitrc"
alias xres="$EDITOR $XRESOURCES && xrdb $XRESOURCES"
alias lfrc="$EDITOR ~/.config/lf/lfrc"
alias vrc="$EDITOR $MYVIMRC"
alias dwmrc="cd ~/downs/repos/suckless/dwm && $EDITOR config.def.h"
alias stc="cd ~/downs/repos/suckless/st && $EDITOR config.def.h"
alias picomrc="$EDITOR ~/.config/picom/picom.conf"
alias dunstrc="$EDITOR ~/.config/dunst/dunstrc"

# Force XDG dir compliance for some programs
alias mbsync="mbsync -c '$XDG_CONFIG_HOME'/isync/mbsyncrc"
alias monerod="monerod --data-dir '$XDG_DATA_HOME'/bitmonero"
alias monero-wallet-cli="monero-wallet-cli --wallet-file ~/.local/share/monero-wallet/monero-wallet --shared-ringdb-dir /dev/null --log-file ~/.cache/monero-wallet-cli.log"

#### Plugins ####

# Autosuggestions 
# remember: changed
# ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# line 36 from color 8 to 7 
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
zstyle ':completion:*' ignored-patterns 'nvidia*|'	# ignore certain patterns

# Syntax highlighting
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

#### POWERLEVEL 10K CONFIG ####
# Theme
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
