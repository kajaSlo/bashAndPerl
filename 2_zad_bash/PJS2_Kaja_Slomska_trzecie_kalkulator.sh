#!/bin/bash

echo "Remember to put '\' sign before multiplication operator. This operator is reserved in bash and tcsh."

flag=false
flag1=false
flag2=false
firstandsecond=false
firstandthird=false
secondandfird=false
multiplication=false
addition=false 
subtraction=false 
division=false 
modulo=false 
power1=false

for i in `seq 1 9`;do
 if [ "$1" == $i ]; then
  flag=true
 fi
 
 if [ "$2" == $i ]; then
  flag1=true
 fi
 if [ "$3" == $i ]; then
  flag2=true
 fi
done
#................
if [[ $flag == true ]] && [[ $flag1 == true ]]; then
  firstandsecond=true
 # echo "first and second"
fi
#................
if [[ $flag == true ]] && [[ $flag2 == true ]]; then
  firstandthird=true
 # echo "first and third"
fi

#................
if [[ $flag1 == true ]] && [[ $flag2 == true ]]; then
  secondandfird=true
 # echo "second and third"
fi

#echo "$flag" "$flag1" "$flag2"
#echo "$firstandsecond $firstandthird" "$secondandfird"

if [[ $firstandsecond == false ]] && [[ $firstandthird == false ]] && [[ $secondandfird == false ]]; then
	echo "You didn't put two alphanumeric arguments on range from 1 to 9"
	exit 1
fi

if [[ $firstandthird == true ]]; then
	case "$2"  in
	  "*") multiplication=true ;;
	  "+") addition=true ;;
	  "-") subtraction=true ;;
	  "/") division=true ;;
	  "^") power1=true;;
	  "%") modulo=true ;;
	 *) echo "No arithmetic argument. Remember to put '\' before multiplication argument"
	esac
fi 

if [[ $firstandsecond == true ]]; then
	case "$3"  in
	  "*") multiplication=true ;;
	  "+") addition=true ;;
	  "-") subtraction=true ;;
	  "/") division=true ;;
	  "^") power1=true;;
	  "%") modulo=true ;;
	 *) echo "No arithmetic argument. Remember to put '\' before multiplication argument"
	esac
fi 

if [[ $secondandfird == true ]]; then
	case "$1"  in
	  "*") multiplication=true ;;
	  "+") addition=true ;;
	  "-") subtraction=true ;;
	  "/") division=true ;;
	  "^") power1=true;;
	  "%") modulo=true ;;
	 *) echo "No arithmetic argument. Remember to put '\' before multiplication argument"
	esac
fi 

if [[ $multiplication == false ]] && [[ $addition == false ]] && [[ $subtraction == false ]] && [[ $division == false ]] && [[ $modulo == false ]] && [[ $power1 == false ]]; then
	#echo "Invalid argument"	
	exit 2
fi

function check_operator {
	if $division;then
		ans=$(awk "BEGIN {printf \"%.2f\",${i}/${j}}")
		printf "%-2s |" "$ans"
	fi
	if $power1;then
		ans=$(( i ** j ))
		printf "%-8s |" "$ans"
	fi
	if $multiplication ;then
		ans=$(( i*j )) 
		printf "%-2s |" "$ans"
	fi
	if $addition;then
		ans=$(( i+j )) 
		printf "%-2s |" "$ans"
	fi
	if $subtraction;then
		ans=$(( i-j )) 
		printf "%-2s |" "$ans"
	fi
	if $modulo;then
		ans=$(( i%j )) 
		printf "%-2s |" "$ans"
	fi
}


if [[ $firstandsecond == true ]]; then
	for i in $(eval echo {$1..$2}); do
  		for j in $(eval echo {$1..$2}); do
  			check_operator
  		done
  	echo " "
	done
fi

if [[ $secondandfird == true ]]; then
	for i in $(eval echo {$2..$3}); do
  		for j in $(eval echo {$2..$3}); do
  			check_operator
  		done
  	echo " "
	done
fi

array=($1 $3)

if [[ $firstandthird == true ]]; then
	for i in $(eval echo {$1..$3}); do
  		for j in $(eval echo {$1..$3}); do
  			check_operator
  		done
  	echo " "
	done
fi
