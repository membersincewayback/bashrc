[[ $- != *i* ]] && return

stty -ixon

HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

alias mv='mv -vi'
alias less='less -s -M'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"
export PAGER="/usr/bin/less"
export TERM="xterm-256color"
export LESSHISTFILE="/dev/null"

if ! [[ "$PATH" =~ "${HOME}/.local/bin:" ]]; then
    export PATH="${HOME}/.local/bin:$PATH"
fi

[[ -f ${HOME}/.local/colors ]] && . "${HOME}/.local/colors"

[[ -f ${HOME}/.local/functions ]] && . "${HOME}/.local/functions"

PS1="\e[${grey}\u${green} | ${grey}\h${green} | ${purple}\w${green}\n$ \[${reset}"
