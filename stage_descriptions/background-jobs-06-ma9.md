A finished background command needs a completion report before it disappears from the job list. In this stage, you'll make `jobs` report a completed job as `Done` once.

### Reaping background jobs

On Unix, a child that exits can remain in the operating system's process table until its parent collects its exit status. That finished process is called a zombie. Collecting the status is called reaping, and your language's subprocess library may perform it for you.

The shell also has its own record of the job. Collecting the OS exit status and removing that record are separate responsibilities: the user still needs to see the completion report once.

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

The `Done` entry must omit the trailing `&`. For `Running` entries, that suffix remains optional.

### Detecting process exit

The mechanism for checking whether each background job has exited depends on your language, but the general approach is to check the process status without waiting for it to finish.

For example:
- In C/Unix: `waitpid(pid, &status, WNOHANG)` can collect an exit without blocking. Inspect `WIFEXITED(status)` only when `waitpid` returns that child's PID.
- In Python: Use `subprocess.Popen.poll()` and check if the return code is not `None`
- In Node.js: Listen for the `exit` event on the child process

Only handle normal process exits in this stage. Signal termination and stopped processes are outside its scope.

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then start a background job and check it with `jobs`:
```bash
$ cat /path/to/fifo &
[1] 84470
$ jobs
[1]+  Running                 cat /path/to/fifo &
$ 
```

The tester writes to the FIFO from a separate process and closes it. The resulting end-of-file makes `cat` exit:
```bash
$ echo -ne "" > /path/to/fifo
```

The next `jobs` call should show the completed job:
```bash
$ jobs
[1]+  Done                    cat /path/to/fifo
```

The following `jobs` call should show nothing:
```bash
$ jobs
$ 
```

The tester will verify that:
- The first `jobs` call shows the job as `Running`. Its trailing `&` remains optional.
- The second `jobs` call shows the job as `Done` without trailing `&`
- The third `jobs` call shows no jobs (the completed job was removed)

### Notes

- You only need to handle a single background job for this stage.
- A normal exit means the process ended by returning or calling an exit function. It does not require an exit status of zero.
