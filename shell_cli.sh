#!/bin/bash
function printHelp {
	$ECHO ""
	$ECHO "USAGE:"
	$ECHO ""
	$ECHO "    $0 [-h | --help]"
	$ECHO ""
	$ECHO "    DESCRIPTION"
	$ECHO ""
}

EXAMPLE_ARG=""

while (($#))
do
	case $1 in
		--help | -h)
			printHelp ;
			exit ;
		;;
        --example)
            shift
            EXAMPLE_ARG="$1"
        ;;
		*)
			$ECHO "Unknown parameter $arg. Try --help for more information."
		exit 1
	esac
	shift
done

if [ "EXAMPLE_ARG" == "" ]; then
    echo "No example given"
    printHelp
    exit 1
fi
