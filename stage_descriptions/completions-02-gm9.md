After completing a command name, users still need to supply arguments. In this stage, you'll let them continue typing and execute the full command with Enter.

### Tab completion with arguments

The completed name and its trailing space remain in the input line. Text typed afterward must become part of that same command, with the arguments preserved when Enter is pressed.

Completing argument text itself is outside this stage.

For example:

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
