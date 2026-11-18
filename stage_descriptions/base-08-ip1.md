Your shell can now locate external programs. In this stage, you'll run them with the user's arguments and return to the prompt when they finish.

### Running external programs

An external program runs in a separate process. Your shell is the parent process, and the program it starts is a child process. The shell stays alive while the child runs, waits for it to finish, and then displays the next prompt.

Use the same PATH lookup behavior as `type` for commands that aren't builtins. If lookup fails, keep reporting the existing command-not-found error.

For example, if the user types `custom_exe arg1 arg2`, your shell should:

- Determine if `custom_exe` is an executable in PATH
- Execute it with an argument list containing `custom_exe` (the program name), `arg1`, and `arg2`

This argument list is commonly called `argv`. Its first entry, `argv[0]`, is the program name, followed by the user's arguments. The test executable reports that first entry too. Preserve the command name the user typed in `argv[0]`, even when PATH lookup finds the program at a longer path.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a command that you need to execute:

```bash
$ custom_exe_1234 alice
Program was passed 2 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: alice
Program Signature: 5998595441
```

The output shown above comes from the executable itself. Your shell just needs to run it and let its output display.

The tester will verify that:

- Your shell correctly finds and executes the program
- The program's output appears in your shell
- The arguments are passed correctly

The tester will run multiple commands and use a random number of arguments each time.

### Notes

- The program name, arguments, and the expected output will be random for each test case.
- You'll need to use your operating system's API to execute external programs (like `exec` family in Unix, `subprocess` in Python, `child_process` in Node.js, etc.)
