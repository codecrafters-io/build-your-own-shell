In this stage, you'll implement recycling job number indices.

### Recycling Job Numbers

Job numbers are assigned sequentially: `1`, `2`, `3`, and so on. When jobs are completed and removed from the table, the next new job reuses the smallest available number. So the next job number depends on how many jobs are still in the table:

- When all jobs have completed, and the table is empty, the next job gets `[1]`.
- If some jobs remain, the next job gets the smallest available number.

For example, if you have jobs `[1]` and `[3]` running, the next job gets `[2]`, not `[4]`.

Here are some more examples: 

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

The tester will also restart your program and verify number reuse when a gap exists:
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

- Job numbers are recycled—they don't grow forever. After job 2 exits, the next job is `[2]`, not `[3]`.
- Always assign the smallest available number, not just the next sequential number.
- When the job table is empty, reset to `[1]`.
