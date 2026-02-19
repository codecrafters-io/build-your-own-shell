In this stage, you'll handle reaping multiple background jobs and updating markers dynamically.

### Reaping multiple background jobs

When several background jobs are running and some of them finish, each completed job gets its own `Done` line before the next prompt. The shell reaps all finished children in a loop (calling `waitpid` with `WNOHANG` repeatedly until no more exited children are found).

The `+` and `-` markers are dynamic. They update when a job is removed from the table. If the current job (`+`) finishes, the previous job (`-`) is promoted to `+`, and the next most recent job becomes `-`.

For example:

```bash
$ sleep 100 &
[1] 84470
$ sleep 1 &
[2] 84471
$
# (after ~1 second, press enter)
[2]+  Done                    sleep 1
$ jobs
[1]+  Running                 sleep 100 &
```

Job 2 was the current job (`+`), but after it finishes and is reaped, job 1 is promoted to `+`.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

```bash
$ sleep 100 &
[1] 84470
$ sleep 2 &
[2] 84471
$ jobs
[1]-  Running                 sleep 100 &
[2]+  Running                 sleep 2 &

# After `sleep 2` finishes (Press enter)
$
[2]+  Done                    sleep 2

# Job 1 is now the current job
$ jobs
[1]+  Running                 sleep 100 &
```

### Notes

- Your reap loop should handle the case where multiple children exit between prompts. Call `waitpid(-1, WNOHANG)` in a loop until it returns 0 or -1.

- Job numbers are stable — a job keeps the number it was assigned for its entire lifetime.

- After removing a finished job, recalculate which job gets `+` and `-`.
