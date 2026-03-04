In this stage, you'll implement launching commands in the background.

### Running in the Background

When an `&` is appended to a command, the shell runs it in the background: it starts the program but does not wait for it to finish. The prompt returns immediately so you can keep typing. The shell prints a line indicating its job number and its process ID.

For example:

```bash
# Launch in the background
$ sleep 30 &
[1] 84470
# Prompt instantly re-appears
$ 
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
$ sleep 500 &
[1] 84470
$ 
```

It will expect the output to be a line containing `[JOB_NUMBER] PID`, immediately followed by the next prompt.