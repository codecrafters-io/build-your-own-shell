In this stage, you'll implement support for autocompleting builtin commands.

Your shell should be able to complete builtin commands when the user presses the `<TAB>` key. Specifically, you'll need to implement completion for the `echo` and `exit` builtins.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send the following inputs, simulating user input and tab presses:

1.  **Input:** `ech`<TAB>
    * The tester expects the prompt to display `echo ` after the tab press.

2.  **Input:** `exi`<TAB>
    * The tester expects the prompt to display `exit ` after the tab press.

The tester checks if the completion works as expected and if your shell outputs the correct output for `echo` and `exit` command.
Note the space at the end of the completion.

### Notes

- We recommend using a library like [readline](https://en.wikipedia.org/wiki/GNU_Readline) for your implementation. Most modern shells and REPLs (like the Python REPL) use readline under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.
- Different shells handle autocompletion differently. For consistency, we recommend using [Bash](https://www.gnu.org/software/bash/) for development and testing.