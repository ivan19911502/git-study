#!/bin/bash

x=273
string=${@:1}
cifra=${#string}-1
a=${string:(-1):1}
b=${string:0:$cifra}

	if [ "$a" = "C" ] && [ $b -ge 0 ]; then
	result=$((x + $b))K
	echo $result
	elif [ "$a" = "K" ] && [ $b -ge 273 ]; then
	result1=$(($b - x))C
	echo $result1
	else 
	echo "Error"
	fi


