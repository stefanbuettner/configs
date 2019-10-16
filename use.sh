#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function backup {
    TARGET=$1
    BACKUP=${TARGET}.bak
    if [ -f ${TARGET} ]; then
        echo "Trying to backup ${TARGET}."
        if [ -f ${BACKUP} ]; then
            echo "${BACKUP} also already exists. Skipping."
            return 1
        else
            echo "Moving to ${BACKUP}."
            mv ${TARGET} ${BACKUP}
            return 0
        fi
    fi
    return 0
}

# Setup vim
SETUP_VIM=false
function setup_vim {
    if [ $SETUP_VIM == true ]; then
        if backup ${HOME}/.vimrc; then
            ln -s ${SCRIPT_DIR}/vim/vimrc ${HOME}/.vimrc
        fi
    fi
}

# Setup i3
SETUP_I3=false
function setup_i3 {
  if [ $SETUP_I3 == true ]; then
    if backup ${HOME}/.config/i3/config; then
	mkdir -p ${HOME}/.config/i3
        ln -s ${SCRIPT_DIR}/i3/i3-config ${HOME}/.config/i3/config
    fi

    if backup ${HOME}/.config/i3status/config; then
	mkdir -p ${HOME}/.config/i3status
        ln -s ${SCRIPT_DIR}/i3/i3status-config ${HOME}/.config/i3status/config
    fi
  fi
}

function print_help {
    echo "$0 program"
    echo ""
    echo "Creates symbolic links for the chosen programs from your home to the configuration files in this repository."
    echo ""
    echo "  program - One or more of: vim, i3"
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
        i3)
            SETUP_I3=true
        ;;
		*)
			echo "Unknown parameter '$1'. Try --help for more information."
		exit 1
	esac
	shift
done

if [ ! $SETUP_VIM -a ! $SETUP_I3 ]; then
    echo "No program given. See --help for more information"
    exit 1
fi

setup_vim
setup_i3
