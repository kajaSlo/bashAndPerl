#!/usr/bin/python
import sys;

first_argument = int(sys.argv[1])
second_argument = int(sys.argv[2])

if first_argument <= 0:
    print "You entered first argument smaller or equal to 0";
    exit (1);

if second_argument <= 0:
    print "You entered second argument smaller or equal to 0";
    exit (1);

if first_argument > second_argument:
    temp = first_argument;
    first_argument = second_argument;
    second_argument = temp;

for i in range(first_argument,second_argument+1):
    for j in range(first_argument,second_argument+1):print i*j,
    print ;
