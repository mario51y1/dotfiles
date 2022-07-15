#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim

# dont put diplicate lines in histori
HISTCONTROL=ignoreboth

# append to history file
shopt -s histappend

#color alias
alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

setxkbmap es,us


#custom alias
alias ll='ls -al'
alias jelp='cat /home/mario51y1/jelp.md'
alias layout='xkb-switch'
alias dotconfig='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
