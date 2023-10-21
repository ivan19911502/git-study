#!/bin/bash

if [[ -n $1 ]] && [[ -n $2 ]]; then
x=$1
y=$2
a=$((x + y))
b=$((x * y))
d=$((x - y))

if [ $2 -eq 0 ]; then
	echo "You can't devede by zero"
else
c=$((x / y))
	echo "Expected Output:"
	echo "Sum: $a"
	echo "Product: $b"
	echo "Quotient: $c"
	echo "Difference: $d"
fi

else
	echo "There's no argument"
fi

