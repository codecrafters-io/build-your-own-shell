In this stage, you'll implement job number reset.

### Job number reset

Job numbers are assigned sequentially: `[1]`, `[2]`, `[3]`, and so on. But when all background jobs have completed and the job table is empty, the counter resets — the next background command gets job number `[1]` again.

For example:

```bash
$ sleep 1 &
[1] 84470
$ sleep 2 &
[2] 84471
$
# (after both jobs finish)
[1]-  Done                    sleep 1
[2]+  Done                    sleep 2
$
# Job table is now empty — next job starts at [1]
$ sleep 10 &
[1] 84490
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will test that the job counter resets when all jobs complete.

```bash
$ sleep 1 &
[1] 84470
$ sleep 2 &
[2] 84471

# Wait for both jobs to complete
$
[1]-  Done                    sleep 1
[2]+  Done                    sleep 2

# Confirm the table is empty
$ jobs
$

# New job gets [1] since the table is empty
$ sleep 10 &
[1] 84490
$ jobs
[1]+  Running                 sleep 10 &
```

The tester will then tear down the shell and launch a new instance:

```bash
$ ./your_shell.sh
```

It will test that the job counter does not reset when at least one job is incomplete.

```bash
$ sleep 100 &
[1] 84500
$ sleep 1 &
[2] 84501

# Wait for job 2 to finish
$ sleep 50 &
[3] 84510

$ jobs
[1]-  Running                 sleep 100 &
[3]+  Running                 sleep 50 &
```

### Notes

- When removing a job from the table, check if the table is now empty. If so, reset your job number counter to 1.
- Job numbers do *not* reset while any job is still in the table. For example, if job 1 finishes but job 2 is still running, the next job gets `[3]`, not `[1]`.
