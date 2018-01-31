#!/usr/bin/python
#Kaja Slomska grupa 2

import cmath
import math

def is_number(s):
    try:
        float(s)
    except ValueError:
        return False

    return True

a = raw_input("Enter a number which will be an a in quadratic equation: ")

if is_number(a) == False:
    print " Value of an argument given as 'a' is NOT a number";
    exit(1);

b = raw_input("Enter a number which will be b in quadratic equation: ")

if is_number(b) == False:
    print " Value of an argument given as 'b' is NOT a number";
    exit(1);

c = raw_input("Enter a number which will be c in quadratic equation: ")

if is_number(c) == False:
    print " Value of an argument given as 'c' is NOT a number";
    exit(1);


a = float(a)
b = float(b)
c = float(c)

delta = ((b*b) - (4*a*c))

#print delta;

if delta < 0:
    root1 = (-b + cmath.sqrt(delta)) / (2 * a)
    root2 = (-b - cmath.sqrt(delta)) / (2 * a)

    print('There are two roots: {0} and {1}'.format(root1, root2))
if delta == 0:
    root = ((-b)/ 2*a )
    print "There is one root: " + str(root);
if delta > 0 :
    root1 = (-b - math.sqrt(delta)) / (2 * a)
    root2 = (-b + math.sqrt(delta)) / (2 * a)

    print('There are two roots: {0} and {1}'.format(root1, root2))