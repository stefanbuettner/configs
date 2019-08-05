#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function backup {
    TARGET=$1
    BACKUP=${TARGET}.bak
    if [ -f ${TARGET} ]; then
        echo "${TARGET} already exists. Moving to ${BACKUP}."
        if [ -f ${BACKUP} ]; then
            echo "${BACKUP} also already exists. Abort."
            exit 1
        fi
        mv ${TARGET} ${BACKUP}
    fi

}

# Setup vim
backup ${HOME}/.vimrc
ln -s ${SCRIPT_DIR}/vim/vimrc ${HOME}/.vimrc

