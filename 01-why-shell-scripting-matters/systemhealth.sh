#!/bin/bash

echo "System health check.."

echo "Disk:"
df -h | grep /xyz

echo "Memory:"
free -m
