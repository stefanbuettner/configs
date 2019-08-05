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
SETUP_VIM=false
function setup_vim {
    if [ $SETUP_VIM == true ]; then
        backup ${HOME}/.vimrc
        ln -s ${SCRIPT_DIR}/vim/vimrc ${HOME}/.vimrc
    fi
}

function print_help {
    echo "$0 program"
    echo ""
    echo "Creates symbolic links for the chosen programs from your home to the configuration files in this repository."
    echo ""
    echo "  program - One or more of: vim"
    echo ""
}

while (($#))
do
	case $1 in
		--help | -h)
			print_help ;
			exit ;
		;;
		vim)
            SETUP_VIM=true
		;;
		*)
			echo "Unknown parameter '$1'. Try --help for more information."
		exit 1
	esac
	shift
done

if [ !$SETUP_VIM ]; then
    echo "No program given. See --help for more information"
    exit 1
fi

setup_vim

