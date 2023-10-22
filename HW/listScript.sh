#!/bin/bash 

if [[ $1 -le 32 ]]; then

	alfabet=(abcdefghijklmnopqrstuvwxyz)



	alfa=${alfabet:0:$1}
	for (( i=0; i<${#alfa}; i++ )); do
		mkdir dir_${alfabet:$i:1}
	done
else
	echo "Error"
fi

