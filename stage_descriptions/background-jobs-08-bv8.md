In this stage, you'll add automatic reaping before each prompt.

### Reaping Before Each Prompt

Up to now, your shell only reaped jobs when the user ran the `jobs` builtin. In this stage, you'll add automatic reaping that happens before every prompt.

Before printing the `$ ` prompt, your shell should:
1. Check all background jobs to see if any have exited
2. Display a `Done` line for each completed job
3. Remove those jobs from the job table
4. Print the prompt

This means completed jobs appear automatically without needing to run `jobs`. The `Done` entries appear between the command output and the next prompt.

For example:
```bash
$ sleep 5 & 
[1] 10637
$ sleep 100 & 
[2] 10638

# After job 1 completes, run any command
$ echo "Hello world"
Hello world
[1]-  Done                    sleep 5
$ 

# The jobs builtin no longer shows job 1 (already reaped)
$ jobs
[2]+  Running                 sleep 100 &
```

Notice the `Done` line appears after the command output but before the next prompt.

### Two Reaping Points

Your shell now reaps jobs in two places:
1. **Before each prompt**: Check for completed jobs after any command (foreground, builtin, background launch, or even empty input)
2. **Inside the jobs builtin**: Check for completed jobs before displaying the list

Both places use the same reaping logic: check for exited jobs, display them as `Done`, then remove them from the table. A job's `Done` entry appears exactly once—either from automatic reaping or from calling `jobs`, whichever happens first.

### Tests

The tester will execute your program:
```bash
$ ./your_program.sh
```

It will launch background jobs:
```bash
$ sleep 500 &
[1] <pid>
$ cat /path/to/fifo &
[2] <pid>
$ jobs
[1]-  Running                 sleep 500 &
[2]+  Running                 cat /path/to/fifo &
```

The tester will make job 2 exit by writing to the FIFO, then run a command:
```bash
$ echo banana
banana
[2]+  Done                    cat /path/to/fifo
$ 
```

The tester will verify that `jobs` no longer shows the reaped job:
```bash
$ jobs
[1]+  Running                 sleep 500 &
```

The tester will verify that:
- The `Done` line appears after the command output and before the next prompt
- The reaped job is removed from the job table
- Subsequent `jobs` calls don't show the already-reaped job
- Markers are recalculated correctly after reaping

### Notes

- Reap before every prompt, not just after foreground commands. This includes after builtins, background launches, and empty input.
- When a job is reaped, it appears as `Done` exactly once, then is removed from the table.
- Both the automatic reaping and the `jobs` builtin use the same reaping logic.
