## ~/.zshrc

## If not running interactively, don't do anything
[[ $- != *i* ]] && return


#### Startup commands ####

# Custom text for terminal title
# (filter '-256color')
cTERM=$( echo $TERM | sed "s/\-256color//g")

# Commands to run on startup
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
	builtin cd "$@" &&  echo -ne "\033]0;$(pwd) - $cTERM\007"
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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
