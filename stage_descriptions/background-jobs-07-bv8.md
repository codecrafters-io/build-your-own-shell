In this stage, you'll make the `jobs` builtin reap children before displaying the job list.

### Reaping with `jobs`

Reaping doesn't only happen before the prompt. The `jobs` builtin also checks for completed children before printing the list. If a job has finished by the time you run `jobs`, it appears as `Done` in the output. On the *next* call to `jobs` (or at the next prompt), that entry is gone.

This means there are two places in your shell that trigger reaping:
1. Before displaying each prompt.
2. Inside the `jobs` builtin, before printing the list.

For example:

```bash
$ sleep 1 &
[1] 84470
$ sleep 100 &
[2] 84471

# After `sleep 1` ends:
$ jobs
[1]-  Done                    sleep 1
[2]+  Running                 sleep 100 &

# Again:
#  On the second `jobs` call, job 1 is already removed and only job 2 remains.
$ jobs
[2]+  Running                 sleep 100 &
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

```bash
$ sleep 1 &
[1] 84470
$ sleep 100 &
[2] 84471

# Wait for job 1 to finish, then run jobs immediately
# (the tester will call jobs before the next prompt reaps)
$ jobs
[1]-  Done                    sleep 1
[2]+  Running                 sleep 100 &

# Second call — Done entry is gone
$ jobs
[2]+  Running                 sleep 100 &
```

### Notes

- When `jobs` reaps a child, it marks the job as `Done`, includes it in the current listing, and removes it afterward. The `Done` entry appears exactly once.
