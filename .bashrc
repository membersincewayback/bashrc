[[ $- != *i* ]] && return

printf '\033c'

[[ -f "/etc/bashrc" ]] && . "/etc/bashrc"

stty -ixon

HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoredups:erasedups
unset HISTTIMEFORMAT
shopt -s histappend

alias mv='mv -i'
alias rm='rm -i'
alias less='less -s -M'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
if dmesg -V &> /dev/null; then alias dmesg='dmesg -TL'; fi

export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"
export PAGER="/usr/bin/less"
export LESSHISTFILE="/dev/null"

[[ "$PATH" != *$HOME/.local/bin:* ]] && export PATH="$HOME/.local/bin:$PATH"

[[ $(last $USER | awk 'NR==2{print $6}') != $(date +%-d) ]] && health

[[ -f $HOME/.local/colors ]] && . "$HOME/.local/colors"

[[ -f $HOME/.local/functions ]] && . "$HOME/.local/functions"

PS1="\e[${grey}\u${green} | ${grey}\h${green} | ${purple}\w${green}\n$ \[${reset}"
