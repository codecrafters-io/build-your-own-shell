A filename prefix may have no matching file or directory. In this stage, you'll leave that input unchanged and ring the terminal bell.

### Missing entry completions

When the user types an argument that doesn't match any entries and presses `<TAB>`, your shell should:
1. Leave the input unchanged (don't modify what the user typed)
2. Print the bell character `\x07` to standard output

The [bell character](https://en.wikipedia.org/wiki/Bell_character) is a control byte. Depending on terminal settings, it may produce a beep or a visual flash. It does not add visible text to the input line.

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
