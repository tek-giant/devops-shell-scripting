#!/bin/bash

set -e

SERVER="209.38.201.69"
TARGET="/home/devops/"

echo "Cleaning directory on $SERVER.."

if [ -z "$TARGET" ]; then
    echo "Error: Target is empty.. Exiting" | tee -a $LOG_FILE
    exit 1
fi

if [[ "$TARGET" != /home/devops/* ]]; then
    echo "Error: Unsafe path detected: $TARGET" | tee -a $LOG_FILE
    exit 1
fi

echo "Files that will be deleted." | tee -a $LOG_FILE

ssh devops@$SERVER "ls $TARGET/*" | tee -a $LOG_FILE

echo "Deleteing files..." | tee -a $LOG_FILE

ssh devops@$SERVER "rm -rf $TARGET/*" | tee -a $LOG_FILE

echo "Cleanup completed successfully.." | tee -a $LOG_FILE

