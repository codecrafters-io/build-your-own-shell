In this stage, you'll extend the path to handle partial completions using the longest common prefix (LCP) logic.

### Completing to the Longest Common Prefix

When multiple entries match the user's input, and some are prefixes of others, your shell should complete to the longest common prefix of all matches.

For example, if these entries exist in your current working directory:

- `xyz_foo/`
- `xyz_foo_bar/`
- `xyz_foo_bar_baz/`

When the user types `ls xyz` and presses tab, the shell completes to `ls xyz_foo` because that is the longest prefix shared by all three entries.

After the user types the next separator character, pressing tab completes to the next common prefix of the remaining matches:

```bash
# Note: The prompt lines below are displayed on the same line
$ ls xyz_<TAB>
$ ls xyz_foo_<TAB>
$ ls xyz_foo_bar_<TAB>
$ ls xyz_foo_bar_baz/
```

If there is only one match after performing completion, then the shell should complete the path as with previous stages (with a trailing space for a filename and a trailing slash for a directory).

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then test progressive tab completion:

```bash
# Note: The prompt lines below are displayed on the same line
$ ls xyz_<TAB>
$ ls xyz_foo_<TAB>
$ ls xyz_foo_bar_<TAB>
$ ls xyz_foo_bar_baz/
```

The tester will verify that:
1. After `xyz_`<TAB>, the completion shows `xyz_foo`.
2. After typing `_` and pressing tab, the completion shows `xyz_foo_bar`.
3. After typing `_` and pressing tab again, the completion shows `xyz_foo_bar_baz/` without a trailing space.
4. The trailing character, either a space or a slash, appears only when exactly one match remains.

### Notes
