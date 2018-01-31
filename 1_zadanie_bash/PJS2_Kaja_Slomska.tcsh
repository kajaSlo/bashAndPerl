#!/usr/bin/tcsh
#Kaja Słomska grupa 2

if ( $# == 0 ) then
	finger $LOGNAME | head -1 | awk -F': ' '{print $3}'
	echo $USER
	exit 0	
endif

set has_help = false
set has_quiet = false
set has_no_arg = true
set has_incorrect_option = false

foreach arg ($*)
	set r = `echo $arg | grep ^-.`
	if ( $arg == "-h" || $arg == "--help" ) then
		set has_help = true
		set has_no_arg = false
		break
	else if ( $arg == "-q" || $arg == "--quiet" ) then
		set has_no_arg = false
		set has_quiet = true
	else if ( "X$r" != "X" ) then
		set has_no_arg = false
		set has_incorrect_option = true
	endif  
end

if ( $has_help == true ) then
	echo "This is help"
	exit 0
else if ( $has_quiet == true ) then
	exit 0
else if ( $has_no_arg == true ) then
	finger $LOGNAME | head -1 | awk -F': ' '{print $3}'
	echo $USER
	exit 0
else if ( $has_incorrect_option == true && $has_help == false && $has_quiet == false ) then
	echo "incorrect option passed!"
	echo "This is help"
	exit 1
endif

