In this stage, you'll handle partial completions using the longest common prefix.

### Longest Common Prefix

The longest common prefix is the longest string that all matching entries share at the start. For example:
- `xyz_foo`, `xyz_foo_bar`, `xyz_foo_bar_baz` have the LCP `xyz_foo`
- `readme.txt`, `report.txt` have the LCP `re`
- `app.py`, `data.json` have no common prefix (empty LCP)

When multiple entries match, complete to the LCP so the user can continue typing and pressing tab to narrow down further:

```bash
$ ls xyz_<TAB>
# Completes to LCP: xyz_foo (shared by all three entries)
$ ls xyz_foo

# User types "_"
$ ls xyz_foo_<TAB>
# Completes to LCP: xyz_foo_bar (shared by xyz_foo_bar/ and xyz_foo_bar_baz/)
$ ls xyz_foo_bar

# User types "_"
$ ls xyz_foo_bar_<TAB>
# Only one match remains, completes with trailing /
$ ls xyz_foo_bar_baz/
```

Notice that the trailing `/` only appears on the final completion when exactly one match remains.

The same logic applies to files. If the entries are `readme.txt` and `report.txt`:
```bash
$ cat r<TAB>
# Completes to LCP: re (shared by both files)
$ cat re

# User types "a"
$ cat rea<TAB>
# Only one match remains, completes with trailing space
$ cat readme.txt 
#                ^
```


### Replacing Bell Behavior

This stage replaces the bell behavior from previous stages. Now, when multiple matches exist:
- If they share a common prefix longer than what's typed: complete to the LCP (no bell)
- If they don't share any additional prefix: ring the bell on the first tab, list matches on the second tab (like before)

### Tests

The tester will create nested entries and execute your program:
```bash
$ ./your_program.sh
```

It will then test progressive tab completion:
```bash
$ ls xyz_<TAB>
$ ls xyz_foo_<TAB>
$ ls xyz_foo_bar_<TAB>
$ ls xyz_foo_bar_baz/
```

The tester will verify that:
- Each tab press completes to the longest common prefix of the remaining matches
- The user can type additional characters to narrow down matches between tab presses
- The trailing character (space or slash) only appears when exactly one match remains

### Notes

- The LCP is computed on entry names without trailing characters. The `/` or space is only added when exactly one match remains.
- Even if the LCP matches a complete entry name (e.g., `foo` when entries are `foo` and `foobar/`), don't add a trailing character if multiple matches still exist.
