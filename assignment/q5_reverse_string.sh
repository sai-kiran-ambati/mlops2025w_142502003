#!/bin/bash

echo "enter a string:"
read input

reverse=""

len=${#input}

for (( i=$len-1; i>=0; i-- ))
do
  reverse="$reverse${input:$i:1}"
done

echo "original string: $input"
echo "reversed string: $reverse"
