if [[ "$-" != *i* ]]; then return; else printf '\033c'; fi

[[ -f "/etc/bashrc" ]] && . "/etc/bashrc"
[[ -f ${HOME}/.local/colors ]] && . "${HOME}/.local/colors"
[[ -f ${HOME}/.local/functions ]] && . "${HOME}/.local/functions"
[[ "$PATH" != *${HOME}/.local/bin:* ]] && export PATH="${HOME}/.local/bin:${PATH}"

stty -ixon

clean_history
HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoredups:erasedups
unset HISTTIMEFORMAT
shopt -s histappend

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias me='ps -flu ${USER}'
alias less='less -s -M'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
if dmesg -V &> /dev/null; then alias dmesg='dmesg -TL'; fi
if command -v bat &> /dev/null; then alias cat='bat -pp'; fi

export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"
export PAGER="/usr/bin/less"
export LESSHISTFILE="/dev/null"
export PYTHONDONTWRITEBYTECODE=1

PS1="\e[${grey}\u${green} | ${grey}\h${green} | ${purple}\w${green}\n$ \[${reset}"
