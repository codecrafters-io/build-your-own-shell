Job numbers can be reused after completed jobs have been reported and removed. In this stage, you'll assign new numbers from the jobs still known to the shell.

### Recycling job numbers

Normally, job numbers are assigned sequentially: `1`, `2`, `3`, and so on. However, when jobs finish, they are removed from the job table, allowing job numbers to be reused.

When assigning a new job number:

- If the job table is empty, assign `[1]`.
- Otherwise, assign one more than the highest job number currently in the table.

These examples show two separate shell sessions. The completion reports are shown at prompt checkpoints, with the intervening wait or input omitted where marked:

```bash
# Recycling to 1 when the table is empty
$ sleep 1 &
[1] 84470
$ sleep 2 &
[2] 84471
# (after both jobs finish)
[1]-  Done                    sleep 1
[2]+  Done                    sleep 2
$ 
# Table is empty — next job starts at [1]
$ sleep 10 &
[1] 84490


# Reusing number 2 when job 2 exits but job 1 remains
$ sleep 100 &
[1] 84470
$ sleep 1 &
[2] 84471
# (after job 2 finishes)
$ echo "Hello"
Hello
[2]+  Done                    sleep 1
$ 
# Job 1 still running — next job gets [2]
$ sleep 10 &
[2] 84490
```

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then start a job, let it finish, then start another to verify recycling to 1:
```bash
$ cat /path/to/fifo &
[1] <pid>

$ echo apple
apple
[1]+  Done                    cat /path/to/fifo
$ 

$ sleep 100 &
[1] <pid>

$ jobs
[1]+  Running                 sleep 100 &
```

The tester will also restart your program and verify number reuse when a job exits:
```bash
$ sleep 100 &
[1] <pid>
$ cat /path/to/fifo &
[2] <pid>

$ echo word
word
[2]+  Done                    cat /path/to/fifo
$ 

$ sleep 50 &
[2] <pid>

$ jobs
[1]-  Running                 sleep 100 &
[2]+  Running                 sleep 50 &
```

The tester will verify that:
- After all jobs finish, the next job gets `[1]`
- When job 2 finishes but job 1 remains, the next job gets `[2]`
- Job numbers don't keep incrementing indefinitely

### Notes

- Removing job 2 allows `[2]` to be reused when job 1 is the highest remaining job. If a higher-numbered job remains, assign one more than that higher number. Gaps below it stay unused.
