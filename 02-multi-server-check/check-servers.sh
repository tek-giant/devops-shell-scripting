#!/bin/bash

servers=("24.144.108.118" "146.190.217.21" "143.198.161.218")

for server in "${servers[@]}"
do
    echo "Checking server: $server"
    ssh devops@$server "df -h | grep /dev"
done