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

It will then launch some background jobs and check their statuses.

```bash
$ sleep 500 &
[1] <pid>
$ cat /path/to/fifo &
[2] <pid>
$ jobs
[1]-  Running                 sleep 500 &
[2]+  Running                 cat /path/to/fifo &
```

The tester will then write empty string to the FIFO, using a separate process, so that the `cat` process in the background finishes.

```bash
# In a separate process
$ echo -ne "" > /path/to/fifo
```

The tester will then run a command, expecting the command's output, followed by the status of the reaped job.

```bash
$ echo banana
banana
[2]+  Done                    cat /path/to/fifo
```

The tester will then run the `jobs` builtin, expecting the entry of the only running job to appear in the output.

```bash
$ jobs
[1]+  Running                 sleep 500 &
```

### Notes

- When a job is reaped, it is marked as `Done`, included in the current listing, and removed afterward. The `Done` entry appears exactly once.
