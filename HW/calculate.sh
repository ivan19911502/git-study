#!/bin/bash

#check for the presence of arguments
if [ $# -ne 2 ]; then
    echo "error:input arguments"
exit 1
fi

#check the divider isn't 0
if [ $2 -eq 0 ]; then
	echo "You can't devede by zero"
else
	echo "Expected Output:"
	echo "Sum: $(($1 + $2))"
	echo "Product: $(($1 * $2))"
	echo "Quotient: $(($1 - $2))"
	echo "Difference: $(($1 / $2))"
fi




