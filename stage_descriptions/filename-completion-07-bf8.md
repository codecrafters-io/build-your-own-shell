In this stage, you'll extend your implementation to handle filepath completion in any argument position.

### Arbitrary argument position

The filename completion works across different argument positions, not only on the first position.

For example, with `foo` (file) and `bar/` (directory) in the current directory:

```bash
$ ls bar/ f<TAB>
$ ls bar/ foo
```

With multiple candidates in a later position (e.g. `foo` and `far` in the current directory):

```bash
$ ls bar/ f<TAB>
# First tab: bell
$ ls bar/ f<TAB><TAB>
# Second tab: options on new line, prompt with "ls bar/ f" on next line
far  foo
$ ls bar/ f
```

The filename completion behavior is same across all argument positions.

### Tests

The tester will test the filename completion behavior in different argument positions.

The tester will create entries in the current working directory, for example:

- `foo` (file)
- `bar/` (directory)

It will then run your program:

```bash
$ ./your_program.sh
```

The tester will simulate:

```bash
$ ls <TAB>
# First tab: bell
$ ls <TAB><TAB>
# Second tab: options on new line, prompt with "ls " on next line
bar/  foo
$ ls 
# Type b and press tab
$ ls b<TAB>
# Expected completion:
$ ls bar/
# Type space and 'f' and press tab:
$ ls bar/ f<TAB>
# Expected completion:
$ ls bar/ foo
# Expected space and 'x' (unmatched prefix)
$ ls bar/ foo x<TAB>
# Expected bell, input unchanged
$ ls bar/ foo x
```

The tester will verify that:

1. First tab with multiple matches rings the bell.
2. Second tab shows the options on a new line and the prompt continues on the next line with the original input preserved.
3. Typing a disambiguating prefix and pressing tab completes to the matching entry (trailing space for file, trailing slash for directory).
4. After a space, typing the first letter of the other entry and pressing tab completes the second argument.
5. After a space, typing a prefix that matches neither entry and pressing tab rings the bell and does not change the input.
