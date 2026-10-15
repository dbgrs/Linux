#!/bin/bash

echo "--- Linux System Information ---"
echo
echo "Linux Distribution : " 
cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2
echo
echo "Kernel Version : " 
uname -r
echo
echo "Hostname : " 
hostname
echo
echo "CPU Architechture : "
uname -m
echo
echo "Memory Information : "
free -h
echo
echo "System uptime : "
uptime -p 
