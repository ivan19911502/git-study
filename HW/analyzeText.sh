#!/bin/bash


#script that accepts a given text.
# input and computes the occurrences of letters, digits, and specified symbols, excluding any spaces.


if [ $# -eq 0 ]; then
echo "Error: no argument"
exit 1
fi


string=${@:1}
words="${string// /}"


letters=$(grep -o '[[:alpha:]]' <<< "$words" | wc -l) 
numbers=$(grep -o '[[:digit:]]' <<< "$words" | wc -l) 
specials=$(grep -o '[*!@#$%^&()_+]' <<< "$words" | wc -l) 

echo "Alfabet: $letters"
echo "Digits: $numbers"
echo "Special Characters: $specials"

