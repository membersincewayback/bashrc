[[ "$-" =~ i ]] && printf '\033[2J\033[H' || return

[[ -f "${HOME}/.local/functions" ]] && . "${HOME}/.local/functions"
[[ "$PATH" =~ "${HOME}/.local/bin" ]] || export PATH="${HOME}/.local/bin:${PATH}"
[[ -f "${HOME}/.local/colors" ]] && {
    . "${HOME}/.local/colors"
    PS1="${grey}\u${green} | ${grey}\h${green} | ${purple}\w${green}\n$ \[${reset}"; }

stty -ixon

type clean_history &> /dev/null && clean_history
HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoredups:erasedups
unset HISTTIMEFORMAT
shopt -s histappend

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias me='ps -flu ${USER}'
alias less='less -sRM'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
dmesg -V &> /dev/null && alias dmesg='dmesg -TL'
type bat &> /dev/null && alias cat='bat -pp'

export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"
export PAGER="/usr/bin/less"
export LESSHISTFILE="/dev/null"
export PYTHONDONTWRITEBYTECODE=1
