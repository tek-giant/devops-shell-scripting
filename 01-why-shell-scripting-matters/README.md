# Episode 1: Why Shell Scripting Matters

## Problem

DevOps engineers constantly need quick system checks, repeatable commands, and simple automation that can run on any Linux host.

## Approach

This episode uses Bash to collect system health information, standardize output, and write useful logs that can be reviewed later.

## Key Learning

- How to structure a small shell script properly
- How to collect basic host health signals
- How to add logging without making the script noisy
- How to make output easier to read in support and incident work

## Practice Challenges

1. Build a script that prints hostname, uptime, disk, and memory in one run.
   - Problem: You need a quick system snapshot during a support call.
   - Expected outcome: One readable output with the key health details.

2. Add timestamped logging to a simple check script.
   - Problem: The script output is hard to trace later.
   - Expected outcome: Every action is written with a timestamp and log level.

3. Create a script that fails fast when a required variable is missing.
   - Problem: A shell script continues with empty input and gives bad results.
   - Expected outcome: The script exits early with a clear error message.

## DevOps Interview Questions (Based on This Episode)

1. Why is shell scripting still important for DevOps?
   - It is fast, available on most Linux systems, and ideal for repeatable operational tasks like checks, cleanup, and incident data gathering.

2. What do you look for in a basic system check script?
   - I want a clear output, simple commands, useful timestamps, and fail-fast behavior when something is wrong.

3. Why is logging useful in small scripts?
   - Logs make the script traceable during incidents, especially when someone needs to know what happened after the script finished.
