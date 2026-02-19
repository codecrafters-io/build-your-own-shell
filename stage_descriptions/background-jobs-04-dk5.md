In this stage, you'll implement the `jobs` builtin so it can list a single background job.

### Displaying all background jobs

When more than one command is running in the background, `jobs` lists them in the order they were started. Job numbers are assigned sequentially: the first background job is `[1]`, the next is `[2]`, and so on. The shell uses two markers: `+` for the *current* job (the one most recently started) and `-` for the *previous* job (the one before that). All other jobs are shown with a space in the marker column.

**Example**

```bash
$ sleep 10 &
[1] 96643
$ sleep 20 &
[2] 96644
$ sleep 30 &
[3] 96645

# The 'current' job (most recently launched) has a '+' marker
# The 'previous' job (launched just before the current one) has a '-' marker
# All other jobs have no markers
$ jobs
[1]   Running                 sleep 10 &
[2]+  Running                 sleep 20 &
[3]+  Running                 sleep 30 &
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then launch jobs in the background and test the output of the `jobs` built-in.

```bash
# Launch a background job
$ sleep 10 & 
[1] 96643

$ jobs
[1]+  Running                 sleep 10 &

# Launch another background job
$ sleep 20 & 
[2] 96644

$ jobs
[1]-  Running                 sleep 10 &
[2]+  Running                 sleep 20 &

# Launch another background job
$ sleep 30 &
[3] 96645

$ jobs
[1]   Running                 sleep 10 &
[2]-  Running                 sleep 20 &
[3]+  Running                 sleep 30 &
```

### Notes

- In this stage you can only keep a record of launched jobs; you do not need to track whether they are still running or have exited. We'll get to that in the later stages.