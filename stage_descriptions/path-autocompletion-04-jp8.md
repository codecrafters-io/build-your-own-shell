In this stage, you'll add support for completing to a directory inside arbitrary paths.

### Completion to a Directory in Paths

When completing a token that contains a path (e.g., with `/`) and the match is a directory:

1. Split the token into a directory part and a prefix.
2. List entries inside the specified directory that match the prefix.
3. Complete the token with the matching directory name and add a trailing slash (no trailing space).

For example:

```bash
$ ls ../relative/../path/to/dire<TAB>
# In the same line
$ ls ../relative/../path/to/directory/
```

### Tests

The tester will create a single directory inside an arbitrary path, e.g. `../relative/../path/to/directory`.

The tester will then execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ ls ../relative/../path/to/dire<TAB>

# In the same line
# Without a trailing space
$ ls ../relative/../path/to/directory/
```

The tester will verify that:

- Pressing tab after the given text autocompletes to the directory name
- A trailing slash is inserted and no trailing space after the slash.

### Notes

- In this stage, you'll only need to handle cases of single matching completion; we'll get to multiple completions in later stages.
