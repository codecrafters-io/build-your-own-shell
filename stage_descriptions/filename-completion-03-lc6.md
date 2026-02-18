In this stage, you'll add support for completing directory names.

### Directory Name Completion

When the user presses `<TAB>` while typing an argument and the match is a directory:

1. Complete the token with the matching directory name.
2. Append a trailing `/` and do not add a space.

For example:

```bash
$ rmdir p<TAB>
# In the same line
$ rmdir pig/

$ rmdir pig/<TAB>
# In the same line
$ rmdir pig/dog/
```

### Tests

The tester will create nested directories in the working directory, e.g. `pig/dog`.

The tester will then execute your program like this:

```bash
$ ./your_shell.sh
```

It will then simulate user input and tab presses:

```bash
$ ls <TAB>

# In the same line
# Without trailing space
$ ls pig/

# On next tab
# Without trailing space
$ ls pig/dog/
```

The tester will verify that:

- The first tab after the command (e.g. `ls `) autocompletes to the first directory with a trailing slash.
- The second tab autocompletes to the full nested path with a trailing slash.
- No trailing space is inserted after the slash.

### Notes

- In this stage, you'll only need to handle cases of single matching completion. We'll get to multiple completions in later stages.
