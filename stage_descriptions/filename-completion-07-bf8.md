Commands often take several paths as arguments. In this stage, you'll extend filename completion to every argument position while preserving earlier arguments.

### Completion in any argument position

So far, your shell completes the first argument after a command.

For this stage, apply the same matching and display rules to whichever argument the user is typing. Preserve nested-path lookup, longest-common-prefix completion, the bell and match list, and the file/directory suffix rules.

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

- Each argument determines its own search directory. A preceding argument such as `bar/` does not change it. In `ls bar/ f<TAB>`, match `f` in the current working directory. An argument containing its own directory prefix still uses that path.
- All completion logic from previous stages applies to every argument position.
