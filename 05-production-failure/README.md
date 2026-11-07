# Episode 5: Dangerous Scripting Mistakes and Safety Practices

## Problem

Cleanup scripts can cause a production incident when validation is weak and deletion runs against the wrong path.

## Approach

This episode teaches guardrails: validate input, restrict paths, support dry-run behavior, and never trust a destructive command without checks.

## Key Learning

- Why `rm -rf` must be guarded carefully
- How to validate paths before deletion
- How to block empty or root targets
- How to make destructive scripts safer to operate

## Practice Challenges

1. Prevent unsafe deletion using validation.
   - Problem: A script may point to the wrong directory and wipe important data.
   - Expected outcome: The script blocks unsafe paths before any deletion runs.

2. Add a dry-run mode to a cleanup script.
   - Problem: You need confirmation of the impact before deleting anything.
   - Expected outcome: The script shows the target files but makes no changes.

3. Write a broken script fix for an empty variable.
   - Problem: A variable resolves to nothing and the script becomes dangerous.
   - Expected outcome: The script fails immediately with a clear error.

## DevOps Interview Questions (Based on This Episode)

1. What are the risks of using `rm -rf`?
   - It can delete the wrong files instantly if the target is empty, wrong, or not validated.

2. How do you make a destructive script safer?
   - I add strict path checks, allowlisted directories, dry-run mode, and logging before any delete action.

3. What would you do if a cleanup script caused an outage?
   - I would stop the script, assess the impact, restore what can be restored, document the validation gap, and add guardrails before the script is reused.
