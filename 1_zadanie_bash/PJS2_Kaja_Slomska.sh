#!/bin/bash
#Kaja Słomska grupa 2

function print_user {
	finger $LOGNAME | head -1 | awk -F': ' '{print $3}'
	echo $USER
}

function print_help {
	echo "This is help"
}

if [[ $# -eq 0 ]]; then
	print_user
	exit 0
fi

has_help=false
has_quiet=false
has_no_arg=true
has_incorrect_option=false

for arg in "$@"; do
	if [[ $arg == "-h" ]] || [[ $arg == "--help" ]]; then
		has_help=true
		has_no_arg=false
		break
	elif [[ $arg == "-q" ]] || [[ $arg == "--quiet" ]]; then
		has_no_arg=false
		has_quiet=true	
	elif [[ $arg =~ ^-. ]] || [[ $arg =~ ^--. ]]; then
		has_no_arg=false
		has_incorrect_option=true
	fi
done

if [[ $has_help == true ]]; then
	print_help
	exit 0
elif [[ $has_quiet == true ]]; then
	exit 0
elif [[ $has_no_arg == true ]]; then
	print_user
	exit 0
elif [[ $has_incorrect_option == true ]] && [[ ! $has_help == true ]] && [[ ! $has_quiet == true ]]; then
	echo "incorrect option passed!"
	print_help
	exit 1
fi

exit 0
