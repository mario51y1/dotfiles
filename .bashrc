# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=100000

[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)

PS2="> "
PS3="> "
PS4="+ "
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[$(tput bold)\]\[\033[38;5;4m\]\u@\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;1m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

alias ls="exa"
alias eza="eza --git --icons"
#change ls to exa
alias exal="eza -l"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
alias pacman="pacman --color=auto"
#change cat to bat
alias cat="bat"

# Try to keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# Try to enable the auto-completion (type: "pacman -S bash-completion" to install it).
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Try to enable the "Command not found" hook ("pacman -S pkgfile" to install it).
# See also: https://wiki.archlinux.org/index.php/Bash#The_.22command_not_found.22_hook
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim

# dont put diplicate lines in histori
HISTCONTROL=ignoreboth

# append to history file
shopt -s histappend

#setxkbmap -layout 'us,es' -variant ','

# To avoid mistakes
#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

#custom alias
alias ll='ls -ahl'
alias jelp='cat /home/mario51y1/jelp.md'
alias layout='xkb-switch'
alias dotconfig='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ..='cd ..'


export PATH=$PATH:/home/mario51y1/.spicetify

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mario51y1/google-cloud-sdk/path.bash.inc' ]; then . '/home/mario51y1/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mario51y1/google-cloud-sdk/completion.bash.inc' ]; then . '/home/mario51y1/google-cloud-sdk/completion.bash.inc'; fi
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#alias for ssh correctly in kitten
alias sshk="kitty +kitten ssh" 
alias cdtfm="cd ~/Documents/TFM/tfm_ws"
source ~/Documents/TFM/tfm_ws/devel/setup.bash

eval "$(starship init bash)"

