#!/bin/bash

echo "enter the coefficients a, b and c of the quation ax^2 + bx + c = 0:"
read -p "a = " a
read -p "b = " b
read -p "c = " c

# calculating the discriminant value
dis=$(echo "$b * $b - 4 * $a * $c" | bc)

if [ "$a" -eq 0 ]; then
    echo "not a quadratic equation (a = 0)"
    exit 1
fi

if [ "$dis" -gt 0 ]; then
    # roots are real and different
    root1=$(echo "scale=2; (-1 * $b + sqrt($dis)) / (2 * $a)" | bc -l)
    root2=$(echo "scale=2; (-1 * $b - sqrt($dis)) / (2 * $a)" | bc -l)
    echo "roots are real and different."
    echo "root1 = $root1"
    echo "root2 = $root2"

elif [ "$dis" -eq 0 ]; then
    # roots are real and equal
    root=$(echo "scale=2; -1 * $b / (2 * $a)" | bc -l)
    echo "roots are real and equal."
    echo "root = $root"

else
    # roots are complex
    real=$(echo "scale = 2; -1 * $b / (2 * $a)" | bc -l)
    img=$(echo "scale = 2; sqrt(-1 * $dis) / (2 * $a)" | bc -l)
    echo "roots are complex."
    echo "root1 = $real + i$img"
    echo "root2 = $real - i$img"
fi

