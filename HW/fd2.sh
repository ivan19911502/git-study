#!/usr/bin/env bash 
echo "This is a standard output that will be silenced" > /dev/null
echo "This is an error message that will be silenced" > /dev/null 2>&1 
exit 0 
