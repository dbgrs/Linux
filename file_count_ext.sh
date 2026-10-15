#!/bin/bash

find . -type f | rev | cut -d. -f1 | rev | sort | uniq -c
