#!/bin/bash

read -p "Enter Username What you want to creat : " USERNAME

if id "$USERNAME" &>/dev/null; then
echo "User $USERNAME is already exists. "
else
sudo useradd -m "$USERNAME" && 
sudo passwd "$USERNAME"
fi
