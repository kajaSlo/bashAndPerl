#!/bin/bash

#if "$1" in `seq 1 9` ; then
#    echo "First argument is not an alphanumeric"
#fi
flag=false
flag1=false

for i in `seq 1 9`;do
 if [ "$1" == $i ]; then
  flag=true
 fi
 if [ "$2" == $i ]; then
  flag1=true
 fi
done

if ! $flag;then
  echo "Bad first argument"
  exit 1
fi

if ! $flag1;then
  echo "Bad second argument"
  exit 1
fi

for i in $(eval echo {$1..$2}); do
  	for j in $(eval echo {$1..$2}); do
  		ans=$(( i * j ))
		printf "%-2s |" "$ans"
  	done
  echo " "
done