In this stage, you'll extend the `jobs` builtin to reap a single job.

### Reaping a background job

When a background process exits, it becomes a zombie — it has finished running but stays in the process table until its parent calls `waitpid`. The shell must reap these children to clean them up.

When the `jobs` builtin is invoked, the shell calls `waitpid()` with the `WNOHANG` flag (which means "check but don't block"). If a child has exited, the shell prints a `Done` line and removes the job from its table.

For example:

```bash
$ sleep 1 &
[1] 84470
# After ~1 second
$ jobs
[1]+  Done                    sleep 1
$ jobs
$
```

The next invocation of `jobs` will not list the job that was already reaped.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

```bash
# Expect: Prompt returns; job line e.g. [1] <pid>
$ sleep 5 &
[1] 84470
$ jobs
[1]+  Running                 sleep 5 &
# After 5 seconds
$ jobs
[1]+  Done                    sleep 5
# Expect: jobs no longer lists that job
$ jobs
$ 
```

### Notes

- In this stage, you'll need to handle reaping a single background job. We'll get to handling reaping multiple background jobs in later stages.

- When using `waitpid`, only handle normal (graceful) exit. You do not need to handle signal termination, stopped, or continued states — only detect that the process has exited normally (e.g. via `WIFEXITED`).