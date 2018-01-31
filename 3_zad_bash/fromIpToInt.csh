#!/usr/bin/tcsh
#Kaja Słomska grupa 2 

set IP="$1"
set ADomain=`echo $IP | cut -d. -f1`
set BDomain=`echo $IP | cut -d. -f2`
set CDomain=`echo $IP | cut -d. -f3`
set DDomain=`echo $IP | cut -d. -f4`
#set INT

set INT=`expr 256 "*" 256 "*" 256 "*" $ADomain`
set INT=`expr 256 "*" 256 "*" $BDomain + $INT`
set INT=`expr 256 "*" $CDomain + $INT`
set INT=`expr $DDomain + $INT`

echo $INT


