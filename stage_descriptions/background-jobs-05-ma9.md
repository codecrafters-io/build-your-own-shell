In this stage, you'll implement reaping of a background job.

### Reaping a background job

When a background process exits, it becomes a zombie — it has finished running but stays in the process table until its parent calls `waitpid`. The shell must reap these children to clean them up. Before displaying each prompt, the shell calls `waitpid()` with the `WNOHANG` flag (which means "check but don't block"). If a child has exited, the shell prints a `Done` line and removes the job from its table.

**Example**

```bash
$ sleep 1 &
[1] 84470
$
# (after ~1 second, press enter)
[1]+  Done                    sleep 1
$
$ jobs
$
```

The `Done` notification appears just before the next prompt. After that, `jobs` no longer lists the completed job.

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

# After 5 seconds (Press enter)
$ 
[1]+  Done                    sleep 5
$

# Expect: jobs no longer lists that job
$ jobs
$ 
```

### Notes

- In this stage, you'll need to handle reaping a single background job. We'll get to handling reaping multiple background jobs in later stages.