#!/bin/bash

SERVER="209.38.201.69"
THRESHOLD=90

usage=$(ssh devops@$SERVER "df / | awk 'NR==2 {print \$5}' | sed 's/%//'")

echo "Disk usage on $SERVER: $usage%"

if [ "$usage" -gt "$THRESHOLD" ]; then
    echo "Warning: Disk usage on $SERVER is above $THRESHOLD%!"
else
    echo "Disk usage on $SERVER is within acceptable limits."
fi