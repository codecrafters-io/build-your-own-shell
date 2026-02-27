In this stage, you'll add support for reaping jobs before printing the next prompt.

### Reaping before the next prompt

Reaping doesn't only happen when `jobs` is invoked. Before printing the next prompt after a command execution, the shell reaps the children and displays the finished jobs. After displaying the finished job before the next prompt, the `jobs` builtin will not display it again.

This means there are two places in your shell that trigger reaping:
1. Before displaying each prompt.
2. Inside the `jobs` builtin, before printing the list.

For example:

```bash
$ sleep 5 & 
[1] 10637
$ sleep 100 & 
[2] 10638
# Run a command after the job 1 has been completed
$ echo "Hello world"
Hello world
[1]-  Done                    sleep 5
# Jobs does not display the already reaped jobs
$ jobs
[2]+  Running                 sleep 100 &
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

```bash

$ sleep 500 & 
[1] 11208
$ sleep 5 & 
[2] 11209
# Before printing the next prompt, after the command execution,
# reap the children and display their status
$ echo Hello
Hello
[2]+  Done                    sleep 5
# jobs displays the running job, which has now been promoted to +
$ jobs
[1]+  Running                 sleep 500 &
```

### Notes

- When a job is reaped, it is marked as `Done`, included in the current listing, and removed afterward. The `Done` entry appears exactly once.
