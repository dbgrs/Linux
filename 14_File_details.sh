#!/bin/bash

read -p "Enter path : "  PATHNAME

if [ ! -e "$PATHNAME" ]; then
echo "Path does  not  exists."
exit 1
fi

echo
echo "Path Information"
echo "--------------------------------------------------"

if [ -f "$PATHNAME" ]; then
echo "Type 	  : Regular File"
elif [ -d "$PATHNAME" ]; then
echo "Type 	  : Directory"
elif [ -L "$PATHNAME" ]; then
echo "Type	  : Symbolic Link"
else
echo "Type        : Other"
fi


echo "Size      : $(stat -c %s "$PATHNAME") bytes"
echo "Permission: $(stat -c %A "$PATHNAME")"
echo "Owner     : $(stat -c %U "$PATHNAME")"
echo "Modified  : $(stat -c %y "$PATHNAME")"
