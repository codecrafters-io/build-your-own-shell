In this stage, you'll extend autocompletion to handle partial completions using the longest common prefix (LCP) logic.

### Completing to Longest Common Prefix

When multiple executables match the user's input, and some are prefixes of others, your shell should complete to the longest common prefix of all matches.

For example, if these executables exist in PATH:

- `xyz_foo`
- `xyz_foo_bar`
- `xyz_foo_bar_baz`

When the user types `xyz_` and presses tab, the shell completes to `xyz_foo` because that is the longest prefix shared by all three executables.

After the user types the next separator character, pressing tab completes to the next common prefix of the remaining matches:

```bash
# Note: The prompt lines below are displayed on the same line
$ xyz_<TAB>
$ xyz_foo_<TAB>
$ xyz_foo_bar_<TAB>
$ xyz_foo_bar_baz 
```

If there is only one match after performing completion, then the shell should complete the command name as with previous stages (with a trailing space).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then test progressive tab completion:

```bash
# Note: The prompt lines below are displayed on the same line
$ xyz_<TAB>
$ xyz_foo_<TAB>
$ xyz_foo_bar_<TAB>
$ xyz_foo_bar_baz 
```

The tester will verify that:
1. After `xyz_`<TAB>, the completion shows `xyz_foo`.
2. After typing `_` and pressing tab, the completion shows `xyz_foo_bar`.
3. After typing `_` and pressing tab again, the completion shows `xyz_foo_bar_baz ` with a trailing space.
4. The trailing space only appears when exactly one match remains.
