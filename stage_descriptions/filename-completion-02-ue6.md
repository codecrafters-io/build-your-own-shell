Users can complete a file's path without first changing the shell's current directory. In this stage, you'll extend filename completion to nested paths.

### Completion in nested paths

So far, your shell only completes filenames in the current directory. Now you'll extend it to complete files in subdirectories when the user includes a path.

For example, if there's a file at `path/to/file.txt`, the user can type:

```bash
$ cat path/to/f<TAB>
$ cat path/to/file.txt 
#                      ^ note the trailing space
```

### The directory and filename prefix

In `path/to/f`, `path/to/` names the directory to search and `f` is the filename prefix. The completed input must keep that directory path, so the result is `path/to/file.txt ` with a trailing space.

A path ending in `/` has an empty filename prefix. Every entry in that directory matches an empty prefix. For this stage, there will be exactly one matching file, so `path/to/` can also complete to `path/to/file.txt `.

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
