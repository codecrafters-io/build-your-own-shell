In this stage, you'll refine your shell's tab completion behavior to handle cases where the user types an entry that is not present.

### Handling Absent Entry Completions

When the user types an argument path that doesn't match any present entries' prefix and presses `<TAB>`, your shell should:

1. Leave the input unchanged (don't modify what the user typed)
2. Ring a bell to indicate there are no valid completions

The bell is produced by printing the [bell character](https://en.wikipedia.org/wiki/Bell_character) `\x07` to the terminal. This typically produces an audible beep or visual flash, depending on the terminal settings.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

The tests will simulate the user typing an invalid command and pressing the `<TAB>` key:

```bash
$ cat absent_filenam<TAB>
$ cat absent_filenam
```

The tester will verify that:
- The input remains unchanged when no completion is possible
- The bell character is printed to indicate no matches
