In this stage, you'll add support for completing filenames in nested paths.

### Completion in Nested Paths

So far, your shell only completes filenames in the current directory. Now you'll extend it to complete files in subdirectories when the user includes a path.

For example, if there's a file at `path/to/file.txt`, the user can type:

```bash
$ cat path/to/f<TAB>
$ cat path/to/file.txt 
#                      ^ note the trailing space
```

### Implementing Path Completion

When the user presses tab, and the partial filename contains a `/`:

1. Split the text at the last `/` character:
   - Everything up to and including the last `/` is the directory path
   - Everything after it is the prefix to match
     
   For example, in `path/to/f`, the directory path is `path/to/` and the prefix is `f`
2. Search the directory path for entries that start with the prefix
3. If one entry matches, replace the entire partial filename with the full path and add a trailing space (e.g., `path/to/f` becomes `path/to/file.txt `)

### Tests

The tester will create a file in a nested directory (e.g., `path/to/file.txt`) and execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ cat path/to/f<TAB>
$ cat path/to/file.txt 
```

The tester will verify that:
- Pressing tab completes the partial path to the full path
- A trailing space is added after the completed path

### Notes

- The directory path is relative to the current working directory. For example, if the current working directory is `/home/user` and the token is `path/to/f`, list entries inside `/home/user/path/to/`.
- You only need to handle the case where exactly one entry matches the prefix. We'll handle multiple matches in later stages.
