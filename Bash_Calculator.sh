#!/bin/bash

echo " --- Bash Calculator --- "
echo
read -p "Enter Value 1 : " value1
read -p "Enter Value 2 : " value2
echo
echo "Addition : +"
echo "Substraction : -"
echo "Multiplication : *"
echo "Division : /"
echo "Modulas : %"
echo
read -p "Choice : " choice
echo

Addition()
{
  sum=$((value1 + value2))
  echo "Addition : $sum"
}

Substraction()
{
  sub=$((value1 - value2))
  echo "Substraction : $sub"
}

Multiplication()
{
  mul=$((value1 * value2))
  echo "Multiplication : $mul"
}

Division()
{  
  div=$((value1 / value2))
  echo "Division : $div"
}

Modulas()
{
  mod=$((value1 % value2))
  echo "Modulas : $mod"
}


case "$choice" in
     "+")
     Addition $1 $2
     ;;
     "-")
     Substraction $1 $2
     ;;
     "*")
     Multiplication $1 $2
     ;;
     "/")
     Division $1 $2
     ;;
     "%")
     Modulas $1 $2
     ;;

     *)
     echo "Enter Valid Input"
     ;;
esac
