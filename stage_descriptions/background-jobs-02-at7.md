In this stage, you'll implement running commands in the background.

### Background Jobs (Recap)

Commands can run in the background by adding `&` at the end. The shell starts the program but doesn't wait for it to finish, allowing you to continue typing other commands.

When a background job starts, the shell prints a line showing its job number and process ID:
```bash
$ sleep 30 &
[1] 84470
$ 
```

The job number `[1]` is assigned sequentially starting from `1`. Each new background job gets the next number. The PID (`84470` in this example) is the actual process ID assigned by the operating system and will vary.

### Running Commands with the `&` Token

After parsing the command line into tokens, check if the last token is `&`. If it is:
1. Remove it from the argument list
2. Run the remaining command in the background
3. Print the job number and PID
4. Show the next prompt immediately

For example, `sleep 30 &` has three tokens: `sleep`, `30`, and `&`. You remove the `&` and run `sleep 30` in the background.

The exact mechanism for running a command in the background depends on your language. For example:
- In C: Call `fork()` and `exec()` but don't call `waitpid()`
- In Python: Use `subprocess.Popen()` without calling `.wait()` or `.communicate()`
- In Node.js: Use `child_process.spawn()` without waiting for the process to exit

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
