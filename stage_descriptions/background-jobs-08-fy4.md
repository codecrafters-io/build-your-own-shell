In this stage, you'll implement recycling job number indices.

### Recycling Job Numbers

Job numbers are assigned sequentially: `1`, `2`, `3`, and so on. When jobs complete and are removed from the table, the next new job reuses the smallest available number. So the next job number depends on how many jobs are still in the table:

- When all jobs have completed and the table is empty, the next job gets `[1]`.
- When some jobs have completed, the next job gets the next number in sequence. For example, if you had jobs `[1]` and `[2]` and job `[2]` completes, only `[1]` remains — the next new job should be `[2]`, not `[3]`.

For example: 

```bash
# Recycle to 1 when the table is empty:

$ sleep 1 &
[1] 84470
$ sleep 2 &
[2] 84471
$
# (after both jobs finish)
[1]-  Done                    sleep 1
[2]+  Done                    sleep 2
$
# Table is empty — next job starts at [1]
$ sleep 10 &
[1] 84490
```

```bash
# Next job is [2] when one of two jobs has exited:

$ sleep 100 &
[1] 84470
$ sleep 1 &
[2] 84471
# (after job 2 finishes)
$ echo "Hello"
Hello
[2]+  Done                    sleep 1
$ sleep 10 &
[2] 84490
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will test that the next job number is recycled to `[1]` when all jobs have completed and the table is empty.

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

The tester will then tear down the shell and launch a new instance and test that the next job number is `[2]` when one of two jobs has exited (only one job remains).

```bash
$ ./your_shell.sh
```

```bash
$ sleep 100 &
[1] 84500
$ sleep 1 &
[2] 84501

# Wait for job 2 to finish
$ echo "Hello"
Hello
[2]+  Done                    sleep 1

# Only job [1] remains — next job must get [2], not [3]
$ sleep 50 &
[2] 84510

$ jobs
[1]-  Running                 sleep 100 &
[2]+  Running                 sleep 50 &
```

### Notes

- When removing a job from the table, the next new job should get the smallest available job number (e.g. 1 when the table is empty, or 2 when only job 1 remains).

- Job numbers do not keep growing forever: after job 2 exits, the next job is `[2]`, not `[3]`.
