# Episode 2: Multi-Server Automation Using SSH

## Problem

In production, you rarely manage one server only. You need a repeatable way to check multiple hosts without logging into each one manually.

## Approach

This episode uses SSH in batch mode with timeouts, per-host status reporting, and safe failure handling so one bad server does not stop the whole run.

## Key Learning

- How to loop through multiple servers safely
- How to run remote commands with SSH
- How to handle unreachable hosts
- How to produce readable output for operations work

## Practice Challenges

1. Write a script to check disk usage across 3 servers.
   - Problem: You need a quick view of storage pressure on multiple Linux hosts.
   - Expected outcome: Each host is checked independently and the result is easy to read.

2. Create a script that verifies SSH access before remote checks.
   - Problem: A server may be unreachable or key-based login may fail.
   - Expected outcome: The script reports which host failed and continues with the others.

3. Add a remote command option to the script.
   - Problem: Operations want to reuse the same script for different checks.
   - Expected outcome: The command can be changed without rewriting the script.

## DevOps Interview Questions (Based on This Episode)

1. How would you automate checks across multiple Linux servers?
   - I would loop through the host list, use SSH in batch mode, add timeouts, and handle each server separately so one failure does not block the rest.

2. What is the main risk of remote automation?
   - One bad command can affect many servers at once, so validation, read-only checks, and clear failure handling are critical.

3. How do you handle an unreachable host in a multi-server script?
   - I log the failure for that host, continue the run, and summarize the failed systems at the end.
