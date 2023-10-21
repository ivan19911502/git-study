#!/bin/bash

if [[ $1 -le 100 ]] && [[ $2 -le 100 ]] && [[ $3 -le 100 ]] && [[ $1 -ge 1 ]] && [[ $2 -ge 1 ]] && [[ $3 -ge 1 ]]; then
if [ $1 -eq $2 ] && [ $2 -eq $3 ]; then
	echo "Expected Output: EXUILATERAL"
elif [ $1 -ne $2 ] && [ $1 -eq $3 ]; then 
	echo "Expected Output: ISOSCELES"
else 
	echo "Expected Output: SCALENE"
fi
else
	echo "Error"
fi
