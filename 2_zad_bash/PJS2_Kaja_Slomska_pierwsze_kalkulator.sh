#!/bin/bash
#Kaja Słomska grupa 2

for i in `seq 1 9`;do
	for j in `seq 1 9`;do
		ans=$(( i * j ))
		#printf  " " "$ans" ;
		
printf "%-2s |" "$ans"
		#echo $i
	done 
	echo "  "
done