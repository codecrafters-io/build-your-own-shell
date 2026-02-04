In this stage, you'll implement path completion for supporting multiple tab presses.

### Multiple Tab Presses

When completing a path with nested directories:

1. First `<TAB>` completes the current token to the longest matching prefix (directory or file).

   * If it’s a directory, append `/` (no trailing space).

2. Subsequent `<TAB>` presses continue completing deeper path segments inside directories.

3. When exactly one file match remains, complete it fully with a trailing space.

For example:

```bash
$ cat f<TAB>
$ cat foo/
$ cat foo/bar/<TAB>
$ cat foo/bar/new.txt<SPACE>
```

### Tests

The tester will create a file: `foo/bar/new.txt` inside the working directory.

The tester will then execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ cat f<TAB>

# In the same line
$ cat foo/

# On next tab
$ cat foo/bar/

# On next tab
# With a trailing space
$ cat foo/bar/new.txt
```

The tester will verify that:

- Pressing tab after the given text autocompletes to the file name with a trailing space, and directory with a trailing slash. 

### Notes

- In this stage, you'll only need to handle cases of single matching completion, we'll get to implementing multiple completions in the later stages.