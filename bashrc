export EDITOR=vim
export LS_OPTIONS='--color'

eval "`dircolors`"

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lA'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

HISTSIZE=5000
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize


