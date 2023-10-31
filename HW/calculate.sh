#!/bin/bash

#check for the presence of arguments
if [ $# -ne 2 ]; then
    echo "error:input arguments"
exit 1
fi

a=$(($1 + $2))
b=$(($1 * $2))
d=$(($1 - $2))

#check the divider isn't 0
if [ $2 -eq 0 ]; then
	echo "You can't devede by zero"
else
c=$(($1 / $2))
	echo "Expected Output:"
	echo "Sum: $a"
	echo "Product: $b"
	echo "Quotient: $c"
	echo "Difference: $d"
fi




