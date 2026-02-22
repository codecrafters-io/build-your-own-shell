In this stage, you'll extend filename completion to work for any argument

### Completion in Any Argument Position

So far, your shell completes the first argument after a command.

For this stage, completion should work the same way for any subsequent argument:
- Extract the text after the last space
- Match it against entries in the current working directory
- Complete using the same rules (LCP, bell for multiple matches, trailing space/slash)

For example, with `foo` (file) and `bar/` (directory) in the current directory:
```bash
$ ls b<TAB>
# Completes to bar/ (directory, no trailing space)
$ ls bar/

# User types space and f
$ ls bar/ f<TAB>
# Completes to foo (file, with trailing space)
$ ls bar/ foo 

# User types space and x
$ ls bar/ foo x<TAB>
# No match, bell rings, input unchanged
$ ls bar/ foo x
```

### Tests

The tester will create entries in the current directory (e.g., `foo` and `bar/`) and execute your program like this:
```bash
$ ./your_program.sh
```

It will then test completion at different argument positions:
```bash
$ ls <TAB><TAB>
bar/  foo
$ ls 

$ ls b<TAB>
$ ls bar/

$ ls bar/ f<TAB>
$ ls bar/ foo 

$ ls bar/ foo x<TAB>
$ ls bar/ foo x
```

The tester will verify that:
- Completion works correctly for the first argument
- Completion works correctly for subsequent arguments
- No match behavior (bell) works in any argument position
- All previous completion features (LCP, multiple matches, etc.) work in any position

### Notes

- Each argument is completed independently against the current working directory. A preceding directory argument (like `bar/`) does not change the search directory for subsequent arguments. For example, in `ls bar/ f<TAB>`, the `f` is matched against entries in the CWD, not inside `bar/`.
- All completion logic from previous stages applies to every argument position.
