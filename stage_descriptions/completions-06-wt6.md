Even an ambiguous command prefix may have more text shared by every match. In this stage, you'll complete that shared portion without choosing one executable.

### Completing to longest common prefix

The longest common prefix (LCP) is the longest starting text shared by every match. When it is longer than the user's current command prefix, insert that shared text. Keep waiting for more input without adding a space while several matches remain.

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

If multiple matches offer no additional shared text, keep the existing behavior: ring the bell on the first Tab and list matches on the second.

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
1. After typing `xyz_` and pressing Tab, the completion shows `xyz_foo`.
2. After typing `_` and pressing tab, the completion shows `xyz_foo_bar`.
3. After typing `_` and pressing tab again, the completion shows `xyz_foo_bar_baz ` with a trailing space.
4. The trailing space only appears when exactly one match remains.
