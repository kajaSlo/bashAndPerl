#!/usr/bin/tcsh
#Kaja Słomska grupa 2

#if "$1" in `seq 1 9` ; then
#    echo "First argument is not an alphanumeric"
#fi

set flag = false
set flag1 = false

foreach i ( `seq 1 9` )
 if ( "$1" == $i ) then
  set flag = true
 endif
 if ( "$2" == $i ) then
  set flag1 = true
 endif
end


if ( $flag == false ) then
  echo "Bad first argument"
  exit 1
endif

if ( $flag1 == false ) then
  echo "Bad second argument"
  exit 1
endif

if ($1 <= $2) then
        foreach i ( `seq $1 $2` )
                foreach j ( `seq $1 $2` )
                        @ a = $i; @ b = $j;
                        @ x = ( $a * $b ); #echo $x
                        printf "%-2s |" "$x"
                end
                echo " "
        end
else
        set i = $1
        set j = $2
        while ($i >= $j)
                set ii = $1
                while ($ii >= $j)
                        @ a = $ii; @ b = $i;
                        @ x = ( $a * $b );
                        @ ii = $ii - 1
                        printf "%-2s |" "$x"
                end
                echo " "
        @ i = $i - 1
        end
endif
