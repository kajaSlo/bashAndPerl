#!/usr/bin/python
#Kaja Slomska grupa 2
import math
import sys
import cmath


if len(sys.argv) != 4:
    print "You didn't put three command line arguments for a, b and c, I cannot do a quadratic equation from what you put"
    exit (1);

first_argument = sys.argv[1]
second_argument = sys.argv[2]
third_argument = sys.argv[3]

first_letter_of_first_argument = first_argument[:1]
first_letter_of_second_argument = second_argument[:1]
first_letter_of_third_argument = third_argument[:1]

if first_letter_of_first_argument != "a" and first_letter_of_first_argument !="b" and first_letter_of_first_argument !="c":
    print "Letter in first argument isn't a, b or c"
    exit (1);

if first_letter_of_second_argument != "a" and first_letter_of_second_argument !="b" and first_letter_of_second_argument !="c":
    print "Letter in second argument isn't a, b or c"
    exit (1);

if first_letter_of_third_argument != "a" and first_letter_of_third_argument !="b" and first_letter_of_third_argument !="c":
    print "Letter in third argument isn't a, b or c"
    exit (1);


if (first_letter_of_first_argument == "a" and first_letter_of_second_argument == "b" and first_letter_of_third_argument == "c") == False and \
        (first_letter_of_first_argument == "a" and first_letter_of_second_argument == "c" and first_letter_of_third_argument == "b") == False and \
                (first_letter_of_first_argument == "b" and first_letter_of_second_argument == "c" and first_letter_of_third_argument == "a") == False and \
                (first_letter_of_first_argument == "b" and first_letter_of_second_argument == "a" and first_letter_of_third_argument == "c") == False and \
                (first_letter_of_first_argument == "c" and first_letter_of_second_argument == "a" and first_letter_of_third_argument == "b") == False and \
                (first_letter_of_first_argument == "c" and first_letter_of_second_argument == "b" and first_letter_of_third_argument == "a") == False:
    print "Wrong arguments. You probably doubled letters in two or three arguments";
    exit (1);


if first_letter_of_first_argument == "a":
    a = first_argument[2:]
elif first_letter_of_second_argument == "a":
    a = second_argument[2:]
elif first_letter_of_third_argument == "a":
    a = third_argument[2:]

if first_letter_of_first_argument == "b":
    b = first_argument[2:]
elif first_letter_of_second_argument == "b":
    b = second_argument[2:]
elif first_letter_of_third_argument == "b":
    b = third_argument[2:]

if first_letter_of_first_argument == "c":
    c = first_argument[2:]
elif first_letter_of_second_argument == "c":
    c = second_argument[2:]
elif first_letter_of_third_argument == "c":
    c = third_argument[2:]


def is_number(s):
    try:
        float(s)
    except ValueError:
        return False

    return True

if is_number(a) == False:
    print " Value of first argument given as 'a' is NOT a number";
    exit(1);

if is_number(b) == False:
    print " Value of first argument given as 'b' is NOT a number";
    exit(1);

if is_number(c) == False:
    print " Value of first argument given as 'c' is NOT a number";
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
