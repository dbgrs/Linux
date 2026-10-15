#!/bin/bash

read -p "Enter username to check group existance : " TARGET_USER

groups "$TARGET_USER"
