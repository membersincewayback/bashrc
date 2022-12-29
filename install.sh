#!/usr/bin/env bash

install() {
    printf "Installation will overwrite .bashrc, .bash_profile, and .vimrc. Proceed? [y/N]\n"

    read -er proceed

    if [[ "${proceed,,}" == "y" ]]; then

        rsync -av "$@" ${HOME}/
        . ${HOME}/.bashrc

    else
        printf "No action taken.\n"
        exit 0
    fi
}

install ".local" ".vim" ".bashrc" ".bash_profile" ".vimrc"
