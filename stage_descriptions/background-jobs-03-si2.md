A background job can produce output while the shell accepts or runs other commands. In this stage, you'll keep that output connected to the terminal.

### Background job output

Standard output (stdout) carries a program's ordinary results, and standard error (stderr) carries diagnostics. For these background commands, both streams remain connected to the terminal, so output can appear while the shell is doing other work.

This Bash example illustrates output arriving after a prompt. Its `&&` command chaining is background context, and implementing `&&` is outside this stage:
```bash
$ sleep 2 && echo "Done sleeping" &
[1] 84470
$ echo "I can type this immediately"
I can type this immediately
$ Done sleeping
```

Here, the job's output (`Done sleeping`) appears in the terminal even though it ran in the background.

For this stage, the background process must share the shell's stdout and stderr. Subprocess APIs have different defaults, so check whether yours inherits these streams or creates separate pipes.

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

The tester uses FIFOs, also called named pipes. A FIFO is a filesystem path through which one process sends bytes to another. A reader can wait for a writer to supply data, which lets the tester control when each command produces output.

It will start a `cat` command reading a FIFO in the background, then another in the foreground:

```bash
$ cat /path/to/fifo1 &
[1] 84470
$ cat /path/to/fifo2
```

The tester will then write to the FIFOs from a separate process. These writer commands illustrate the test setup, and aren't sent to your shell:
```bash
$ echo -ne "Hello from FIFO#1\n" > /path/to/fifo1
Hello from FIFO#1
$ echo -ne "Hello from FIFO#2\n" > /path/to/fifo2
Hello from FIFO#2
```

The tester will verify that:
- The background job's output appears in the terminal
- The foreground job's output appears in the terminal
- Both processes share the same stdout/stderr as the shell

### Notes

- In Node.js, `stdio: "inherit"` connects the child to the parent's standard streams. The default for `child_process.spawn()` creates pipes instead.
- Keep child stdout and stderr connected to the terminal. This stage does not require background input handling or job-control signals.
