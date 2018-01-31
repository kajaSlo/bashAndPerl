#!/usr/bin/tcsh
#Kaja Słomska grupa 2

foreach i ( `seq 1 9` )
	foreach j ( `seq 1 9` )
		@ a = $i; @ b = $j;
		@ x = ( $a * $b ); #echo $x
		printf "%-2s |" "$x"
	end
	echo " "
end
