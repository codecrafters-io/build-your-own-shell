A background command leaves the shell ready for more input without waiting for the program to finish. In this stage, you'll launch external commands ending in `&` that way.

### Background jobs (recap)

Commands can run in the background by adding `&` at the end. The shell starts the program but doesn't wait for it to finish, allowing you to continue typing other commands.

When a background job starts, the shell prints a line showing its job number and process ID:
```bash
$ sleep 30 &
[1] 84470
$ 
```

The job number `[1]` is assigned sequentially starting from `1`. Each new background job gets the next number. The PID (`84470` in this example) is the actual process ID assigned by the operating system and will vary.

### Running commands with the `&` token

An unquoted trailing `&` is shell control syntax. It must not become an argument to the program. For `sleep 30 &`, the program receives `30` as its argument and runs in the background.

Print `[JOB_NUMBER] PID` after starting the process, then display the next prompt without waiting for the process to finish. The PID must identify the child that is actually running.

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then start a sleep command in the background:
```bash
$ sleep 500 &
[1] 84470
$ 
```

The tester will verify that:
- The output contains `[JOB_NUMBER] PID` on one line
- The next prompt appears immediately (the shell doesn't wait for the command to finish)
- The background process actually starts running

### Notes

- In this stage, only one background job will be started, so the job number will always be `[1]`.
- Process-launch APIs differ by language. In C, `fork()` and `exec()` can start the child without a blocking `waitpid()` at launch. In Python, `subprocess.Popen()` starts it without an immediate `.wait()` or `.communicate()`. In Node.js, `child_process.spawn()` starts it asynchronously. Collecting exit status comes in later stages.
