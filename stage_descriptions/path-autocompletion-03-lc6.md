In this stage, you'll add support for completing to a file inside arbitrary paths.

### Completion to a File in Paths

When completing a token that contains a path (e.g., with `/`) and the match is a file:

1. Split the token into a directory part and a prefix.
2. List entries inside the specified directory that match the prefix.
3. Complete the token with the matching file name and add a trailing space.

For example:

```bash
$ cat /path/to/f<TAB>
# In the same line
$ cat /path/to/file.txt 
```

### Tests

The tester will create a single file inside an arbitrary directory, e.g. `/path/to/file.txt`.

The tester will then execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ cat /path/to/f<TAB>

# In the same line
# With a trailing space
$ cat /path/to/file.txt 
```

The tester will verify that:

- Pressing tab after the given text autocompletes to the file name
- A trailing space is inserted after the completion.

### Notes

- In this stage, you'll only need to handle cases of single matching completion. We'll get to directories in paths and multiple completions in later stages.
