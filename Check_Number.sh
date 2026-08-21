#!/bin/bash

read -p "Enter Number : " number

if [[ $number =~ ^-?[0-9]+$ ]]; then

if [ $number -eq 0 ]; then
echo "Number is 0"
elif [ $number -lt 0 ]; then
echo "Nmber is Nagative"
elif [ $number -gt 0 ]; then
echo "Number is Positive"
fi

if (( number % 2 == 0)); then
echo "Number is Even"
else
echo "Number is Odd"

else
echo "Enter Value is non-numeric."
fi

