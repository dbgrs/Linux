#!/bin/bash

read -p "Enter Number : " number

if [[ $number =~ ^-?[0-9]+$ ]]; then

sum=$((number * (number + 1) / 2))

echo "Sum of 'N' Number : " $sum

else
echo "Enter Value is non-numeric."

fi
