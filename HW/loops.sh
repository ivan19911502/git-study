#!/bin/bash

#produce the reversed version of the input string.
if [ -n "$*" ]; then


echo "$*" | tr 'a-zA-Z' 'A-Za-z' | rev

else
	echo "Error"
fi
