if [[ "$-" != *i* ]]; then return; else printf '\033c'; fi

[[ -f "/etc/bashrc" ]] && . "/etc/bashrc"
[[ -f ${HOME}/.local/colors ]] && . "${HOME}/.local/colors"
[[ -f ${HOME}/.local/functions ]] && . "${HOME}/.local/functions"

stty -ixon

clean_history
HISTSIZE=5000
HISTFILESIZE=5000
unset HISTTIMEFORMAT

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

[[ "$PATH" != *${HOME}/.local/bin:* ]] && export PATH="${HOME}/.local/bin:${PATH}"

[[ $(last $USER | awk 'NR==2{print $6}') != $(date +%-d) ]] && health

PS1="\e[${grey}\u${green} | ${grey}\h${green} | ${purple}\w${green}\n$ \[${reset}"
