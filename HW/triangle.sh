#!/bin/bash


arguments=("$@")


if [ ${#arguments[@]} -ne 3 ]; then 
# check count of arguments
echo "insert 3 argument, pls"
exit 1
fi

for a in "${arguments[@]}"; do
# check range of values
if ((a < 1 || a > 100)); then
echo "insert 3 arguments from 1 to 100"
exit 1
fi
done




if [ $1 -eq $2 ] && [ $2 -eq $3 ]; then
	echo "Expected Output: EXUILATERAL"
elif [ $1 -ne $2 ] && [ $1 -eq $3 ]; then 
	echo "Expected Output: ISOSCELES"
else 
	echo "Expected Output: SCALENE"
fi
