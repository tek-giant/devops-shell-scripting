# Episode 3: Disk Full Issue Detection and Cleanup

## Problem

Logs grow fast, disks fill up, and services fail because there is no free space left.

## Approach

This episode combines disk monitoring with safe cleanup. The goal is to detect pressure early, identify large files, and remove only what is approved.

## Key Learning

- How to detect disk pressure before an outage
- How to find the biggest files and directories
- How to clean logs safely with guardrails
- Why dry-run and validation matter in cleanup scripts

## Practice Challenges

1. Simulate log file explosion and clean safely.
   - Problem: A log directory keeps growing and starts filling the disk.
   - Expected outcome: Large files are identified and handled without unsafe deletion.

2. Add a dry-run mode to a cleanup script.
   - Problem: Operations want to review the impact before any cleanup runs.
   - Expected outcome: The script shows what would change without modifying files.

3. Fix a broken script with a missing variable.
   - Problem: A cleanup script runs with an empty path and becomes dangerous.
   - Expected outcome: The script exits before any file operation happens.

4. Write a script to check disk usage across `/`, `/var`, and `/tmp`.
   - Problem: You need a fast storage health snapshot.
   - Expected outcome: The script reports usage per mount point and highlights thresholds.

## DevOps Interview Questions (Based on This Episode)

1. How do you handle disk full issues in Linux?
   - I confirm the full filesystem, identify the biggest consumers, stop the growth if needed, and free space safely before restarting affected services.

2. Why is truncating a log file safer than deleting it?
   - Truncation keeps the file path and permissions intact, which is often safer for running applications than removing the file entirely.

3. What should a good cleanup script always include?
   - Validation, dry-run support, clear logging, and hard checks against dangerous targets like `/` or an empty variable.
