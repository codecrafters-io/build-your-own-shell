In this stage, you'll implement the `jobs` builtin so it can list a single background job.

### Displaying a single background job
Once a command is launched with `&`, the shell keeps a record of it (job number, command line, and whether it is still running). The `jobs` builtin prints that list. Each line shows the job number in brackets, a status such as `Running`, and the command that was run. In this stage you only need to list a single jobs that is still running; you do not need to detect when it has exited.

For example:

```bash
# Launch program in the background
$ sleep 10 &
[1] 84470

# The '+' indicates the most recently started job
# With a single job, it is always the current one.
$ jobs
[1]+  Running                 sleep 10 &
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then use the `jobs` built-in:

```bash
$ sleep 10 &
[1] 84470

# Expected 1 job to be running
$ jobs
[1]+  Running                 sleep 10 &
```

### Notes

- In this stage you only need to list a single jobs that is still running. You do not need to detect when it has exited. We'll get to that in the later stages.

- In this stage, the tester will only test the output of the `jobs` built-in against a single background job.