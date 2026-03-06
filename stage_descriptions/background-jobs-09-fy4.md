In this stage, you'll implement recycling job number indices.

### Recycling Job Numbers

Job numbers are assigned sequentially: `1`, `2`, `3`, and so on. When jobs complete and are removed from the table, the next new job reuses the smallest available number. So the next job number depends on how many jobs are still in the table:

- When all jobs have completed and the table is empty, the next job gets `[1]`.
- When some jobs have completed, the next job gets the smallest available number. For example, if jobs `[1]` and `[2]` were started, and job `[2]` completes, only `[1]` remains — the next new job should be `[2]`, not `[3]`.

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

It will then launch a background job.

```bash
$ cat /path/to/fifo &
[1] <pid>
```

The tester will then write an empty string to FIFO, using a separate process, so the background job finishes.

```bash
# In a separate process
$ echo -ne "" > /path/to/fifo
```

The tester will then run a command, and expect the output of the command to appear, followed by an entry for the reaped job.

```bash
$ echo apple
apple
[1]+  Done                    cat /path/to/fifo
```

The tester will then again run a command, and expect only the output of the command to appear on the shell.

```bash
$ echo ball
ball
# Expect: No jobs
$ jobs
# Next job will be numbered from 1
$ sleep 100 &
[1] <pid>
# Expect: 1 running job
$ jobs
[1]+  Running                 sleep 100 &
```

The tester will tear down the shell, and again run your program like this:

```bash
$ ./your_shell.sh
```

It will then launch two background jobs: sleep 100 and cat on a FIFO.

```bash
$ sleep 100 &
[1] <pid>
$ cat /path/to/fifo &
[2] <pid>
```

The tester will then write an empty string to the FIFO, using a separate process, so the cat job finishes.

```bash
# In a separate process
$ echo -ne "" > /path/to/fifo
```

The tester will then run a command, and expect the output of the command to appear, followed by an entry for the reaped job.

```bash
$ echo <word>
<word>
[2]+  Done                    cat /path/to/fifo
```

The tester will then launch another background job, and expect it to be assigned job number [2] (the smallest available, since only job 1 remains).

```bash
$ sleep 50 &
[2] <pid>
```

The tester will then run jobs, and expect two entries: job 1 running, job 2 running.

```bash
$ jobs
[1]-  Running                 sleep 100 &
[2]+  Running                 sleep 50 &
```

### Notes

- When removing a job from the table, the next new job should get the smallest available job number (e.g. 1 when the table is empty, or 2 when only job 1 remains).

- Job numbers do not keep growing forever: after job 2 exits, the next job is `[2]`, not `[3]`.
