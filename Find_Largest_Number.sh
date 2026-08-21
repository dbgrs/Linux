#!/bin/bash

read -p "Enter Number A : " number1
read -p "Enter Number B : " number2
read -p "Enter Number C : " number3

if [[ $number1 =~ ^-?[0-9]+$ && $number2 =~ ^-?[0-9]+$ && $number3 =~ ^-?[0-9]+$ ]]; then

if [[ $number1 -gt $number2 && $number1 -gt $number3 ]]; then
echo "A is Largest Number : $number1"
elif [[ $number2 -gt $number3 && $number2 -gt $number1 ]]; then
echo "B is Largest Number : $number2 "
else
echo "C is Largest Number : $number3 "
fi

else
echo "Enter Value is non-numeric."
fi

