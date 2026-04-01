In this stage, you'll pass `COMP_LINE` and `COMP_POINT` into a `-C` completer as environment variables.

### `COMP_LINE` and `COMP_POINT` variables

In addition to `argv[1]`-`argv[3]`, the shell also passes the following as environment variables to the completer script.

- `COMP_LINE` — The full text of the command line the user is editing, exactly as it appears before the tab press (one string, not including the trailing newline).

- `COMP_POINT` — The zero-based index into `COMP_LINE` where the cursor sits: the position at which the next typed character would be inserted. For a tab press at the end of the partial word being completed, this is the length of `COMP_LINE` in bytes.

For example:

```bash
$ complete -C /path/to/completer_script systemctl
$ systemctl start r<TAB>
$ systemctl start redis 
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will register a command-based completion rule. The `complete` command should produce no output.

```bash
$ complete -C /path/to/completer_script git
$ git ad
$ git add 
```

In the example above, when the completer runs for that tab press:

- `argv[1]`: `git` (command name)
- `argv[2]`: `ad` (current word being completed)
- `argv[3]`: `git` (previous word)

- `COMP_LINE`: `git ad` (full edited line)
- `COMP_POINT`: the index of the cursor in `COMP_LINE` at the time of completion. For example, if the cursor is immediately after the `d` in `git ad`, then `COMP_POINT` is `6` (since `'git ad'` has 6 characters in ASCII).

The completer script will only work correctly `COMP_LINE` and `COMP_POINT` are set in the environment to the values the current line implies.

If `COMP_LINE` or `COMP_POINT` is not passed, or is incorrect, the tester’s script will not produce the right candidates and completion will fail.
