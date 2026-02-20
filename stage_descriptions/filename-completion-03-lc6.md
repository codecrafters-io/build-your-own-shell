In this stage, you'll add support for completing directory names.

### Directory Name Completion

So far, your shell completes filenames and file paths. Now you'll extend it to complete directories.

Directory completion helps users navigate into subdirectories without typing the full path.

When the user presses `<TAB>` and the match is a directory:
1. Complete the token with the matching directory name
2. Append a trailing `/` with no space
   
For example:

```bash
$ cd proj<TAB>
$ cd project/
#           ^ note the trailing slash (no space)
```

The trailing `/` lets the user immediately press tab again to complete the next level of the path.

Here are some more examples:

```bash
# Example 1: Complete a directory
$ rmdir p<TAB>
$ rmdir pig/

# Example 2: Complete into a directory
$ rmdir pig/<TAB>
$ rmdir pig/dog/
```

In the second example, the user starts with `pig/` already typed, then presses tab to complete to `pig/dog/`.

### Tests

The tester will create nested directories (e.g., `pig/dog/`) and execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input:

```bash
$ ls <TAB>
$ ls pig/
$ ls pig/<TAB>
$ ls pig/dog/
```

The tester will verify that:
- The first tab after the command (e.g., `ls `) autocompletes to the first directory with a trailing slash.
- The second tab completes to the nested directory with a trailing slash.
- No trailing space is added after the slashes.

### Notes

- You only need to handle the case where exactly one entry matches. We'll handle multiple matches in later stages.
- Both file and directory completion should work. Files get a trailing space, directories get a trailing slash with no space.
- Check if an entry is a directory using your language's filesystem functions (e.g., `os.path.isdir()` in Python, `fs.statSync().isDirectory()` in Node.js).
