#!/bin/bash

set -e

ROOM="$*"
FILE="completed.txt"

if [ -z "$ROOM" ]; then
    echo 'Usage: ./tryhackme-progress/add-room.sh "Room Name"'
    exit 1
fi

if grep -Fxq "$ROOM" "$FILE"; then
    echo "Already recorded: $ROOM"
    exit 0
fi

printf '%s\n' "$ROOM" >> "$FILE"

git add "$FILE"
git commit -m "Complete TryHackMe room: $ROOM"
git push origin main
