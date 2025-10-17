In this stage, you'll add support for running external programs with arguments.

### Running External Programs

So far, you've implemented builtin commands that your shell executes directly. Now you'll handle external programs that your shell needs to find and run.

When a command isn't a builtin, your shell should:
1. Search for an executable with the given name in the directories listed in PATH (just like `type` does)
2. If found, execute the program
3. Pass any arguments from the command line to the program

For example, if the user types `custom_exe arg1 arg2`, your shell should:
- Find `custom_exe` in PATH
- Execute it with three arguments: `custom_exe` (the program name), `arg1`, and `arg2`

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
- The output in the example ("Program was passed N args...") comes from the executable. It's not something you need to implement manually.
- You'll need to use your operating system's API to execute external programs (like `exec` family in Unix, `subprocess` in Python, `child_process` in Node.js, etc.)
