#!/bin/bash

if [ -n "$*" ]; then


echo "$*" | tr 'a-zA-Z' 'A-Za-z' | rev

else
	echo "Error"
fi
