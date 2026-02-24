In this stage, you'll handle reaping multiple background jobs and updating markers dynamically.

### Reaping multiple background jobs

When several background jobs are running and some of them finish, each completed job gets its own `Done` line before the next prompt. The shell reaps all finished children in a loop (calling `waitpid` with `WNOHANG` repeatedly until no more exited children are found).

The `+` and `-` markers are dynamic. They update when a job is removed from the table. If the current job (`+`) finishes, the previous job (`-`) is promoted to `+`, and the next most recent job becomes `-`.

For example:

```bash
$ sleep 100 & 
[1] 10886
$ sleep 5 & 
[2] 10887
$ sleep 6 & 
[3] 10892

# After job number 2 and 3 have completed
$ jobs
[1]   Running                 sleep 100 &
[2]-  Done                    sleep 5
[3]+  Done                    sleep 6

# jobs still displays the remaining job, and it is promoted to current (+)
$ jobs
[1]+  Running                 sleep 100 &
```

Job 1 was neither current nor the previous job, but is promoted to the current job (+) after the existing 'current' and 'previous' jobs were reaped.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

```bash
$ sleep 100 & 
[1] 10168
$ sleep 5 & 
[2] 10171
$ sleep 10 & 
[3] 10173
# After job number 2 has finished
$ jobs
[1]   Running                 sleep 100 &
[2]-  Done                    sleep 5
[3]+  Running                 sleep 10 &
# After job number 3 has finished
$ jobs
[1]-  Running                 sleep 100 &
[3]+  Done                    sleep 10
# List remaining jobs
$ jobs
[1]+  Running                 sleep 100 &
```

### Notes

- Your reap loop should handle the case where multiple children exit between prompts. Call `waitpid(-1, WNOHANG)` in a loop until it returns 0 or -1.

- Job numbers are stable — a job keeps the number it was assigned for its entire lifetime.

- After removing a finished job, recalculate which job gets `+` and `-`.
