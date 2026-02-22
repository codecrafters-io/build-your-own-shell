In this stage, you'll handle cases where no entries match the argument.

### Missing Entry Completions

When the user types an argument that doesn't match any entries and presses `<TAB>`, your shell should:
1. Leave the input unchanged (don't modify what the user typed)
2. Print the bell character `\x07` to standard output

The [bell character](https://en.wikipedia.org/wiki/Bell_character) typically produces an audible beep or visual flash, depending on the terminal settings.

For example:
```bash
$ cat absent_filenam<TAB>
# No completion occurs, input unchanged
# Bell character (\x07) printed to stdout
$ cat absent_filenam
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input with a non-existent path:

```bash
$ cat absent_filenam<TAB>
$ cat absent_filenam
```

The tester will verify that:
- The input remains unchanged when no completion is possible
- The bell character is printed to standard output

