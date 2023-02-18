#!/usr/bin/env bash

files=( ".local" ".vim" ".bashrc" ".bash_profile" ".vimrc" )

install() {
    read -erp "Overwrite .bashrc, .bash_profile, and .vimrc? [y/N]: " proceed

    if [[ "${proceed,,}" == "y" ]]; then
        rsync -avc "${files[@]}" "${HOME}"/
    else
        printf "No action taken.\n"
        exit 0
    fi
}

install
