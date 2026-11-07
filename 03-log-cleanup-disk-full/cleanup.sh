#!/bin/bash

SERVER="209.38.201.69"

echo "Check large log files on server: $SERVER"
ssh devops@$SERVER "find /home/devops/ -type f -size +200M -delete -print"

echo "Checking is done and large log files are deleted if they exist."