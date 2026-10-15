#!/bin/bash

echo "--- Linux System Monitor ---"
echo
echo "CPU USAGE"
top -bn1 | grep  "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'
echo
echo "MEMORY USAGE"
free -h
echo
echo "DISK USAGE"
df -h
echo
echo "SYSTEM UPTIME"
uptime -p
echo
echo "LOGGED-IN USER"
who
echo
echo "RUNNING PROCESS"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 10
echo
echo "--- END ---"
