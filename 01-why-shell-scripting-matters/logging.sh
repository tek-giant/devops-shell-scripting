#!/bin/bash

echo "Started at $(date)" > output.log

uptime >> output.log
df -h >> output.log

echo "Completed" >> output.log