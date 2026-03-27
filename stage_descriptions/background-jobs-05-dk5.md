In this stage, you'll extend the `jobs` builtin to list multiple background jobs.

### Displaying Multiple Background Jobs

When multiple commands run in the background, the `jobs` command lists them in the order they were started.

Job numbers are assigned sequentially: the first background job is `[1]`, the next is `[2]`, and so on.

The shell uses markers to indicate special jobs:
- `+` - The most recently started job (the "current" job)
- `-` - The second most recently started job (the "previous" job)  
- Space (` `) - All other jobs

For example, with three background jobs:
```bash
$ sleep 10 &
[1] 96643
$ sleep 20 &
[2] 96644
$ sleep 30 &
[3] 96645
$ jobs
[1]   Running                 sleep 10 &
[2]-  Running                 sleep 20 &
[3]+  Running                 sleep 30 &
```

In this example, the "current" job 3 has a `+` marker, the "previous" job 2 has a `-` marker, while job 1 gets a space.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then launch jobs and verify the `jobs` output after each one:

```bash
$ sleep 10 & 
[1] 96643
$ jobs
[1]+  Running                 sleep 10 &

$ sleep 20 & 
[2] 96644
$ jobs
[1]-  Running                 sleep 10 &
[2]+  Running                 sleep 20 &

$ sleep 30 &
[3] 96645
$ jobs
[1]   Running                 sleep 10 &
[2]-  Running                 sleep 20 &
[3]+  Running                 sleep 30 &
```

The tester will verify that:
- Jobs are listed in order by job number
- The most recent job has the `+` marker
- The second most recent job has the `-` marker
- All other jobs have a space in the marker column

### Notes

- Jobs should always be displayed in order by job number (1, 2, 3...).
- You only need to track launched jobs. Detecting when jobs exit will come in later stages.
