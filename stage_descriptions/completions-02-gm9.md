In this stage, you'll extend your shell's tab completion to handle commands with arguments.

Your shell should now not only complete the command itself but also correctly handle the subsequent arguments that the user types.
This means that after completing the command with `<TAB>`, it should allow the user to continue typing arguments, and those arguments should also be interpreted correctly.
You'll need to ensure commands like `echo` autocomplete and still function correctly with arguments.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

The tests will simulate user input with tab presses and will execute builtin commands, similar to previous stages, with added arguments:

1.  **Input:** `ech<TAB>` `hello<ENTER>`

    - The tester expects the shell to first complete the `ech` to `echo` after `<TAB>`, then accept the `hello` argument, and after the `<ENTER>` key press, execute `echo hello`.
    - The shell should output `hello`.

2.  **Input:** `ech<TAB>` `foo bar<ENTER>`
    - The tester expects the shell to first complete `ech` to `echo` after `<TAB>`, then accept the `foo bar` arguments, and after the `<ENTER>` key press, execute `echo foo bar`.
    - The shell should output `foo bar`.

The tester will verify that your shell properly completes the commands and executes the commands with the given arguments.
