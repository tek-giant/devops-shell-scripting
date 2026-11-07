#!/bin/bash

SERVER="209.38.201.69"
SERVICE="devops-app"
LOG_FILE="monitor.log"

echo "Checking $SERVICE on $SERVER..."

if ssh devops@$SERVER "systemctl is-active --quiet $SERVICE"
then
    echo "$(date) - $SERVICE is running" | tee -a $LOG_FILE
else
    echo "$(date) - $SERVICE is down. Restarting..." | tee -a $LOG_FILE

    ssh devops@$SERVER "sudo systemctl restart $SERVICE"

    sleep 2

    if ssh devops@$SERVER "systemctl is-active --quiet $SERVICE"
    then
        echo "$(date) - Restart successful" | tee -a $LOG_FILE
    else
        echo "$(date) - Restart FAILED" | tee -a $LOG_FILE
    fi
fi