In this stage, you'll extend your shell's tab completion to handle commands with arguments.

### Tab Completion with Arguments

In previous stages, you implemented basic tab completion for builtin commands. Now, you'll ensure that after a command is completed, the user can continue typing arguments and execute a full command.

For example:

```bash
```bash
# 1. User types partial command
$ ech

# 2. User presses <TAB>. Shell autocompletes (note the trailing space)
$ echo 

# 3. User types argument 'hello'
$ echo hello

# 4. User presses <ENTER>. Shell executes the command
hello
```

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

The tests will simulate user input with tab presses and will execute builtin commands, similar to previous stages, with added arguments:

```bash
$ ech<TAB>
$ echo 
$ echo hello<ENTER>
hello

$ ech<TAB>
$ echo
$ echo foo bar<ENTER>
foo bar
```

The tester will verify that:
- Tab completion works correctly.
- Arguments typed after completion are preserved.
- The complete command executes correctly with all arguments.
