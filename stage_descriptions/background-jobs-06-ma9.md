In this stage, you'll extend the `jobs` builtin to reap completed background jobs.

### Reaping Background Jobs

Reaping means checking whether background processes have exited and cleaning them up. When a background process exits, it becomes a zombie process—it has finished running but stays in the process table until the parent process acknowledges its exit. The shell must check for these exited processes and clean them up.

When the user runs `jobs`, your shell should:
1. Check each background job to see if it has exited
2. If a job has exited, display it with status `Done` in the current output
3. Remove the `Done` job from the job table so it doesn't appear in subsequent `jobs` calls

For example:
```bash
$ sleep 1 &
[1] 84470
# After ~1 second, the process has exited
$ jobs
[1]+  Done                    sleep 1
# The next jobs call shows nothing (job was removed)
$ jobs
$
```

Notice that the `Done` entry doesn't have a trailing `&` unlike `Running` entries.

### Detecting Process Exit

When `jobs` runs, check each background job to see if it has exited. The mechanism depends on your language, but the general approach is to check the process status without blocking (don't wait for it to finish if it's still running).

For example:
- In C/Unix: Use `waitpid(pid, &status, WNOHANG)` and check `WIFEXITED(status)`
- In Python: Use `subprocess.Popen.poll()` and check if the return code is not `None`
- In Node.js: Listen for the `exit` event on the child process

Only handle normal exits for this stage. Don't worry about processes killed by signals or stopped processes—just detect when a process exits normally.

### Tests

The tester will execute your program:
```bash
$ ./your_program.sh
```

It will start a background job and check it with `jobs`:
```bash
$ cat /path/to/fifo &
[1] 84470
$ jobs
[1]+  Running                 cat /path/to/fifo &
$ 
```

The tester will then write to the FIFO to make the `cat` process exit:
```bash
$ echo -ne "" > /path/to/fifo
```

The next `jobs` call should show the completed job:
```bash
$ jobs
[1]+  Done                    cat /path/to/fifo
```

The following `jobs` call should show nothing (the job has been removed):
```bash
$ jobs
$ 
```

The tester will verify that:
- The first `jobs` call shows the job as `Running` with trailing `&`
- The second `jobs` call shows the job as `Done` without trailing `&`
- The third `jobs` call shows no jobs (the completed job was removed)

### Notes

- You only need to handle a single background job for this stage. Multiple jobs will come later.
- Only detect normal exits (process exited cleanly). Don't handle signal termination or stopped states.
