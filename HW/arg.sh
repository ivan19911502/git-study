#!/bin/bash

if [ -n "$1" ]; then


if [ $(wc -c "$1" | awk '{print $1}') -le 1024 ]; then 
	echo "Expected Output: OK"
else
	echo "FAIL"
fi


else
	echo "Error"
fi

