#!/usr/bin/tcsh
#Kaja Słomska grupa 2 

set INT="$1"

set D_domain=`expr $INT % 256`
set C_domain=`expr '(' $INT - $D_domain ')' / 256 % 256`
set B_domain=`expr '(' $INT - $C_domain - $D_domain ')' / 65536 % 256`
set A_domain=`expr '(' $INT - $B_domain - $C_domain - $D_domain ')' / 16777216 % 256`

echo "$A_domain.$B_domain.$C_domain.$D_domain"
