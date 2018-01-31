#!/usr/bin/tcsh

#Kaja Słomska grupa 2
set VAR="`ping $1 -c 5 |& grep 'unknown' | cut -b 7-13`"

if ( "$VAR" == "unknown" ) then
	echo "$1"  " --> nie"
else
	echo "$1"  " --> tak"
endif
