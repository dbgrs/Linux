#!/bin/bash

services=("ssh", "cron", "apache2", "mysql")

echo "Linux Service Status"
echo

for services in  "${services[@]}"
do
   if ! systemctl  list-until-files "${service}.service" --no legend 2>/dev/null | grep -q .; then
   	echo "$service : NOT FOUND"
   elif systemctl is-active --quiet "$service"; then
   	echo "$service : RUNNING"
   else 
	echo "$service : STOPPED"
   fi
done
