#!/bin/bash
#Kaja Słomska grupa 2

first_ip_is_a_domain=false
second_ip_is_a_domain=false


function convert_ip_to_int()
{
  local IP="$1"
  local A_domain=`echo $IP | cut -d. -f1`
  local B_domain=`echo $IP | cut -d. -f2`
  local C_domain=`echo $IP | cut -d. -f3`
  local D_domain=`echo $IP | cut -d. -f4`
  local INT

  INT=`expr 256 "*" 256 "*" 256 "*" $A_domain`
  INT=`expr 256 "*" 256 "*" $B_domain + $INT`
  INT=`expr 256 "*" $C_domain + $INT`
  INT=`expr $D_domain + $INT`

  echo $INT
}



function conver_int_to_ip()
{
  local INT="$1"

  local D_domain=`expr $INT % 256`
  local C_domain=`expr '(' $INT - $D_domain ')' / 256 % 256`
  local B_domain=`expr '(' $INT - $C_domain - $D_domain ')' / 65536 % 256`
  local A_domain=`expr '(' $INT - $B_domain - $C_domain - $D_domain ')' / 16777216 % 256`

  echo "$A_domain.$B_domain.$C_domain.$D_domain"
}

function validate_ip_addresses()
{

if ping -c 1 $1 &> /dev/null
then
  echo "$1" " --> tak"
else
  echo "$1" " --> nie"
fi
}

#.........................................start
for i in $1;do
    if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        first_ip_is_a_domain=true
        continue
    else
        cmd='dig +short $1'
        first_argument=$(eval $cmd)
        echo "IP address of a domain given as a 1st argument: " "$first_argument"
    fi
done

for i in $2;do
    if [[ $2 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        second_ip_is_a_domain=true
        continue
    else
        cmd2='dig +short $2'
        second_argument=$(eval $cmd2)
        echo "IP address of a domain given as a 2nd argument: " "$second_argument"
    fi
done
#---------------
if $first_ip_is_a_domain && $second_ip_is_a_domain;then
    S=`convert_ip_to_int $1`
    E=`convert_ip_to_int $2`

    if (( "$S" > "$E" )) ;then
        z=$S
        S=$E
        E=$z
    fi

    for INT in `seq $S 1 $E`
    do

    IP=`conver_int_to_ip $INT`
	
    validate_ip_addresses "$IP"
	

    done
fi

if  [[ $first_ip_is_a_domain == false ]] &&  [[ $second_ip_is_a_domain == false ]];then
    S=`convert_ip_to_int $first_argument`
    E=`convert_ip_to_int $second_argument`

    if (( "$S" > "$E" )) ;then
        z=$S
        S=$E
        E=$z
    fi

    for INT in `seq $S 1 $E`
    do

    IP=`conver_int_to_ip $INT`

    validate_ip_addresses "$IP"

    done
fi

#..................................................
if  [[ $first_ip_is_a_domain == false ]] &&  [[ $second_ip_is_a_domain == true ]];then
    S=`convert_ip_to_int $first_argument`
    E=`convert_ip_to_int $2`

    if (( "$S" > "$E" )) ;then
        z=$S
        S=$E
        E=$z
    fi

    for INT in `seq $S 1 $E`
    do

    IP=`conver_int_to_ip $INT`

    validate_ip_addresses "$IP"

    done
fi
#..................................................
if  [[ $first_ip_is_a_domain == true ]] &&  [[ $second_ip_is_a_domain == false ]];then
    S=`convert_ip_to_int $1`
    E=`convert_ip_to_int $second_argument`

    if (( "$S" > "$E" )) ;then
        z=$S
        S=$E
        E=$z
    fi

    for INT in `seq $S 1 $E`
    do

    IP=`conver_int_to_ip $INT`

    validate_ip_addresses "$IP"

    done
fi
