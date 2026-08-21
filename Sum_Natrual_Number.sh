#!/bin/bash

read -p "Enter Number : " number

sum=$((number * (number + 1) / 2))

echo "Sum of 'N' Numbers : $sum"

