#!/bin/bash

FILE="birthdays.txt"
TODAY=$(date +"%d-%m")

echo "TODAY = [$TODAY]"

while IFS=: read -r USERNAME LOGIN_NAME BIRTHDATE
do
    echo "USERNAME=[$USERNAME]"
    echo "LOGIN_NAME=[$LOGIN_NAME]"
    echo "BIRTHDATE=[$BIRTHDATE]"

    if [ "$BIRTHDATE" = "$TODAY" ]; then
        echo ">>> BIRTHDAY MATCHED <<<"

        who | while read -r USER TTY REST
        do
            echo "WHO: USER=[$USER], TTY=[$TTY]"

            if [ "$USER" = "$LOGIN_NAME" ]; then
                echo ">>> USER MATCHED <<<"
                echo "Happy Birthday, $USERNAME! Have a wonderful day!" > "/dev/$TTY"
            fi
        done
    fi
done < "$FILE"