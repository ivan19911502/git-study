#!/bin/bash


#generate count of directories with naming them alphabetically

if [[ $1 -ge 32 ]]; then
echo "Error, input number 1-32!"
exit 1
fi

alfa=({a..z})
for (( i=0; i<$1; i++ )); do
mkdir dir_${alfa[i]}
done


