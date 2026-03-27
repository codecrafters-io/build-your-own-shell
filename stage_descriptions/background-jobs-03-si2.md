In this stage, you'll ensure background jobs can print output to the terminal.

### Background Job Output

When a command runs in the background with `&`, the background process's standard output and error streams remain connected to the shell's terminal. This means any output it produces should still appear in your shell.

For example:
```bash
$ sleep 2 && echo "Done sleeping" &
[1] 84470
$ echo "I can type this immediately"
I can type this immediately
$ Done sleeping
```

Here, the job's output (`Done sleeping`) appears in the terminal even though it ran in the background.

For this stage, you must ensure the background process shares the same stdout and stderr as the shell. When spawning the background process, let it inherit the shell's stdio streams. In most subprocess APIs, this is the default behavior (e.g., `stdio: "inherit"` in Node.js, or not redirecting stdout/stderr in Python's `subprocess`).

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then start two cat commands (one background, one foreground) that read from FIFOs:
```bash
$ cat /path/to/fifo1 &
[1] 84470
$ cat /path/to/fifo2
```

The tester will write to the FIFOs and verify that output from both jobs appears in the terminal:
```bash
Hello from FIFO#1
Hello from FIFO#2
```

### Notes

- The tester uses FIFOs (named pipes) to control when output appears. A FIFO is a special file that blocks reads until someone writes to it.
- Make sure child processes inherit the shell's stdio streams.
