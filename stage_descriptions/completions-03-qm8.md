A prefix without a matching completion needs feedback that leaves the user free to keep editing. In this stage, you'll preserve that input and ring the terminal bell.

### Handling missing completions

When no known builtin starts with the typed prefix and the user presses `<TAB>`, your shell should:

1. Leave the input unchanged (don't modify what the user typed)
2. Ring a bell to indicate there are no valid completions

The bell is produced by printing the [bell character](https://en.wikipedia.org/wiki/Bell_character) `\x07` to the terminal. This typically produces an audible beep or visual flash, depending on the terminal settings.

Pressing Tab does not execute the input. A failed completion should leave the command line available for editing without printing a command-not-found error.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

The tests will simulate the user typing a prefix with no match and pressing the `<TAB>` key:

```bash
$ xyz<TAB>
$ xyz
```

The tester will verify that:
- The input remains unchanged when no completion is possible
- The bell character is printed to indicate no matches
