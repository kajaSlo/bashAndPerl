#!/usr/bin/tcsh
#Kaja Słomska grupa 2

set first_argument=`dig +short "$1"`
set second_argument=`dig +short "$2"`

set S=`tcsh fromIpToInt.csh $first_argument`
set E=`tcsh fromIpToInt.csh $second_argument`

if (( "$S" > "$E" )) then
set z=$S
set S=$E
set E=$z
endif

foreach INT ( `seq $S 1 $E` )

set IP=`tcsh fromIntToIp.csh $INT`

set validate=`tcsh validateIPAddress.csh $IP`  
echo "$validate"	

end
    



