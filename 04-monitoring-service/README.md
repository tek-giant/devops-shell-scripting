# Episode 4: Service Monitoring and Auto-Restart

## Problem

A production service can stop unexpectedly, and the application becomes unavailable until someone notices and restarts it.

## Approach

This episode uses a self-healing pattern. The script checks service health, restarts the service if needed, and verifies recovery before reporting success.

## Key Learning

- How to check whether a service is active
- How to restart a failed service safely
- How to confirm the restart actually worked
- How to keep an operational audit trail

## Practice Challenges

1. Detect a stopped service and restart it.
   - Problem: A critical service is down and users are impacted.
   - Expected outcome: The script detects the failure, restarts the service, and verifies recovery.

2. Add retry logic to a service monitor.
   - Problem: One restart attempt may not be enough in a noisy environment.
   - Expected outcome: The script retries a limited number of times and stops cleanly if recovery fails.

3. Add logging to the recovery flow.
   - Problem: Operations need a record of each recovery attempt.
   - Expected outcome: The script logs the check, restart, and final status with timestamps.

## DevOps Interview Questions (Based on This Episode)

1. How would you automate service recovery?
   - I would check service state, restart only when needed, verify the service is active again, and log the full recovery flow.

2. What is the difference between monitoring and self-healing?
   - Monitoring tells you the service is down. Self-healing also tries to recover it automatically and confirm success.

3. Why should a restart script verify recovery?
   - Because a restart command can succeed even if the service still fails to become healthy afterward.
