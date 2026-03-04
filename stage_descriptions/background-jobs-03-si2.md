In this stage, you'll implement wiring up background job's output streams to the terminal.

### Running in the Background

When an `&` is appended to a command, the shell runs it in the background. Its standard input, standard output, and standard error are still connected to the shell, which means any output produced by the background job is still printed to the shell.

For example:

```bash
# Create two FIFOs
$ mkfifo /path/to/fifo1
$ mkfifo /path/to/fifo2
# Launch in the background
$ cat /path/to/fifo1 &
[1] 84470
# This hangs up because it is launched in the foreground, and is 
# waiting for a process to write to the pipe
$ cat /path/to/fifo2

```

In another shell,
```bash
$ echo "apple" > /path/to/fifo1
```

The content of the first pipe is written to the original shell, following the cat command.

```bash
apple
```

In another shell,
```bash
$ echo "ball" >> /path/to/fifo2
```

The content of the second pipe is written to the original shell, following the previous output.

```bash
ball
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will start a sleep command in the background.

```bash
# Expected output:
# [JOB_NUMBER] PID
# Immediately followed by the next prompt
$ cat /path/to/fifo1 &
[1] 84470
$ cat /path/to/fifo2

```

The tester will then write random content to the `fifo1`. E.g.

```bash
$ echo -ne "Hello from FIFO#1\n" >> /path/to/fifo1
```

It will expect the written content to appear on the shell on the line following the cat command.

```bash
Hello from FIFO#1
```

The tester will then write random content to the `fifo2`. E.g.

```bash
$ echo -ne "Hello from FIFO#2\n" >> /path/to/fifo2
```

It will expect the written content to appear on the shell on the line following the previous output.

```bash
Hello from FIFO#2
```
