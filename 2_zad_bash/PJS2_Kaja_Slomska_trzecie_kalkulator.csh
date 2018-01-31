#!/usr/bin/tcsh

echo "Remember to put '\' sign before multiplication operator. This operator is reserved in bash and tcsh."

set flag = false
set flag1 = false
set flag2 = false
set firstandsecond = false
set firstandthird = false
set secondandfird = false
set multiplication = false
set addition = false #dodawanie
set subtraction = false #odejmowanie
set division = false #dzielenie
set modulo = false 
set power = false

foreach i ( `seq 1 9` )
 if ( "$1" == $i ) then
  set flag = true
 endif
 if ( "$2" == $i ) then
  set flag1 = true
 endif
 if ( "$3" == $i ) then
  set flag2 = true
 endif
end
#................

if ( ( $flag == true ) && ( $flag1 == true ) ) then
  set firstandsecond = true
#  echo "first and second"
endif
#................
if ( ( $flag == true ) && ( $flag2 == true ) ) then
  set firstandthird = true
#  echo "first and third"
endif

#................
if ( ( $flag1 == true ) && ( $flag2 == true ) ) then
  set secondandfird = true
#  echo "second and third"
endif


#echo "$flag" "$flag1" "$flag2"
#echo "$firstandsecond $firstandthird" "$secondandfird"

if ( ( $firstandsecond == false ) && ( $firstandthird == false ) && ( $secondandfird == false ) ) then
	echo "You didn't put two alphanumeric arguments on range from 1 to 9"
	exit 1
endif

if ( $firstandthird == true ) then
	if ( "$2" == "+" ) then	
		set addition = true
	else if ( "$2" == "*" ) then	
		set multiplication = true 
	else if ( "$2" == "-" ) then	
		set subtraction = true
	else if ( "$2" == "/" ) then	
		set division = true
	else if ( "$2" == "%" ) then	
		set modulo = true 
	else if ( "$2" == "^" ) then
		set power = true
	else
		echo "No arithmetic argument. Remember to put '\' before multiplication argument"
	endif
endif 

if ( $firstandsecond == true ) then

	if ( "$3" == "+" ) then	
		set addition = true
	else if ( "$3" == "*" ) then	
		set multiplication = true 
	else if ( "$3" == "-" ) then	
		set subtraction = true
	else if ( "$3" == "/" ) then	
		set division = true
	else if ( "$3" == "%" ) then	
		set modulo = true 
	else if ( "$3" == "^") then
		set power = true
	else
		echo "No arithmetic argument. Remember to put '\' before multiplication argument"
	endif
	
endif 

if ( $secondandfird == true ) then

	if ( "$1" == "+" ) then	
		set addition = true
	else if ( "$1" == "*" ) then	
		set multiplication = true 
	else if ( "$1" == "-" ) then	
		set subtraction = true
	else if ( "$1" == "/" ) then	
		set division = true
	else if ( "$1" == "%" ) then	
		set modulo = true 
	else if ( "$1" == "^" ) then
		set power = true
	else
		echo "No arithmetic argument. Remember to put '\' before multiplication argument"
	endif
endif  


if ( ( $multiplication == false ) && ( $addition == false ) && ( $subtraction == false ) && ( $division == false ) && ( $modulo == false ) && ( $power == false ) ) then
	#echo "Invalid argument"	
	exit 2
endif

set ans = 0

#...........................................
if ( $firstandsecond == true ) then

	if ($1 <= $2) then
		foreach i ( `seq $1 $2` )
			foreach j ( `seq $1 $2` )
				@ a = $i; @ b = $j;
				if ( $division == true ) then
					set dans = `echo "scale=2;$a/$b" | bc`
					printf "%-4s |" "$dans"
				endif
				if ( $multiplication == true ) then
					@ ans = $a * $b
					printf "%-2s |" "$ans"
				endif
				if ( $addition == true ) then
					@ ans = $a + $b 
					printf "%-2s |" "$ans"
				endif
				if ( $subtraction == true ) then
					@ ans = $a - $b 
					printf "%-2s |" "$ans"
				endif
				if ( $modulo == true ) then
					@ ans	= $a % $b 
					printf "%-2s |" "$ans"
				endif
				if ( $power == true ) then
					set dans = `echo "$a^$b" | bc`
					printf "%-8s |" "$dans"
				endif
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

			
			if ( $division == true ) then
				set dans = `echo "scale=2;$a/$b" | bc`
				@ ii = $ii - 1
				printf "%-4s |" "$dans"
			endif
			if ( $multiplication == true ) then
				@ ans = $a * $b
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $addition == true ) then
				@ ans = $a + $b 
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $subtraction == true ) then
				@ ans = $a - $b 
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $modulo == true ) then
				@ ii = $ii - 1
				@ ans	= $a % $b 
				printf "%-2s |" "$ans"
			endif
			if ( $power == true) then
				set dans = `echo "$a^$b" | bc`
				@ ii = $ii - 1
				printf "%-8s |" "$dans"
			endif
		end
			  echo " "

                        @ i = $i - 1
                        
                end
        endif
endif
#...........................................
if ( $secondandfird == true ) then

	if ($2 <= $3) then
		foreach i ( `seq $2 $3` )
			foreach j ( `seq $2 $3` )
				@ a = $i; @ b = $j;
				if ( $division == true ) then
					set dans = `echo "scale=2;$a/$b" | bc`
					printf "%-2s |" "$dans"
				endif
				if ( $multiplication == true ) then
					@ ans = $a * $b
					printf "%-2s |" "$ans"
				endif
				if ( $addition == true ) then
					@ ans = $a + $b 
					printf "%-2s |" "$ans"
				endif
				if ( $subtraction == true ) then
					@ ans = $a - $b 
					printf "%-2s |" "$ans"
				endif
				if ( $modulo == true ) then
					@ ans	= $a % $b 
					printf "%-2s |" "$ans"
				endif
				if ( $power == true ) then
					set dans = `echo "$a^$b" | bc`
					printf "%-8s |" "$dans"
				endif
		  	end
		  echo " "
	end
else
        set i = $2
        set j = $3
        while ($i >= $j)
                set ii = $2
                while ($ii >= $j)
                        @ a = $ii; @ b = $i;

			
			if ( $division == true ) then
				set dans = `echo "scale=2;$a/$b" | bc`
				@ ii = $ii - 1
				printf "%-2s |" "$dans"
			endif
			if ( $multiplication == true ) then
				@ ans = $a * $b
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $addition == true ) then
				@ ans = $a + $b 
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $subtraction == true ) then
				@ ans = $a - $b 
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $modulo == true ) then
				@ ii = $ii - 1
				@ ans	= $a % $b 
				printf "%-2s |" "$ans"
			endif
			if ( $power == true) then
				set dans = `echo "$a^$b" | bc`
				@ ii = $ii - 1
				printf "%-8s |" "$dans"
			endif
		end
			  echo " "

                        @ i = $i - 1
                        
                end
        endif
endif
#...................	
set array = ( $1 $3 )
if ( $firstandthird == true ) then

	if ($1 <= $3) then
		foreach i ( `seq ${array[1]} ${array[2]}` )
			foreach j ( `seq ${array[1]} ${array[2]}` )
				@ a = $i; @ b = $j;
				if ( $division == true ) then
					set dans = `echo "scale=2;$a/$b" | bc`
					printf "%-4s |" "$dans"
				endif
				if ( $multiplication == true ) then
					@ ans = $a * $b
					printf "%-2s |" "$ans"
				endif
				if ( $addition == true ) then
					@ ans = $a + $b 
					printf "%-2s |" "$ans"
				endif
				if ( $subtraction == true ) then
					@ ans = $a - $b 
					printf "%-2s |" "$ans"
				endif
				if ( $modulo == true ) then
					@ ans	= $a % $b 
					printf "%-2s |" "$ans"
				endif
				if ( $power == true ) then
					set dans = `echo "$a^$b" | bc`
					printf "%-8s |" "$dans"
				endif
		  	end
		  echo " "
	end
else
        set i = $1
        set j = $3
        while ($i >= $j)
                set ii = $1
                while ($ii >= $j)
                        @ a = $ii; @ b = $i;

			
			if ( $division == true ) then
				set dans = `echo "scale=2;$a/$b" | bc`
				@ ii = $ii - 1
				printf "%-2s |" "$dans"
			endif
			if ( $multiplication == true ) then
				@ ans = $a * $b
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $addition == true ) then
				@ ans = $a + $b 
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $subtraction == true ) then
				@ ans = $a - $b 
				@ ii = $ii - 1
				printf "%-2s |" "$ans"
			endif
			if ( $modulo == true ) then
				@ ii = $ii - 1
				@ ans	= $a % $b 
				printf "%-2s |" "$ans"
			endif
			if ( $power == true) then
				set dans = `echo "$a^$b" | bc`
				@ ii = $ii - 1
				printf "%-8s |" "$dans"
			endif
		end
			  echo " "

                        @ i = $i - 1
                        
                end
        endif
endif


