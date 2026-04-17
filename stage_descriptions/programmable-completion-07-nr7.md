In this stage, you'll pass `COMP_LINE` and `COMP_POINT` as environment variables when invoking a completer script.

### Completion Environment Variables

In earlier stages, you passed the command name, current word, and previous word as arguments to the completer. Some completers also need to know the full command line and where the cursor is. Your shell should set two environment variables before invoking the completer:

- `COMP_LINE` — The full text of the command line as it appears when TAB is pressed (no trailing newline).
- `COMP_POINT` — The zero-based byte index of the cursor position in `COMP_LINE`. When TAB is pressed at the end of the line, this is the length of `COMP_LINE`.

For example, if the user types:

```bash
$ git ad<TAB>
```

Your shell should set:

- `COMP_LINE`: `git ad`
- `COMP_POINT`: `6` (the string `git ad` is 6 bytes long, and the cursor is at the end)

These are set as environment variables on the completer process, alongside the `argv[1]`, `argv[2]`, and `argv[3]` arguments from earlier stages.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then register a completer script and trigger completion:

```bash
$ complete -C /path/to/completer_script git
$ git ad<TAB>
$ git add 
```

The completer script relies on both the argv arguments and the environment variables to produce the correct candidate. If `COMP_LINE` or `COMP_POINT` is missing or incorrect, the script will not return the right result, and completion will fail.

The tester will verify that:

- `COMP_LINE` is set to the full command line text at the time of the TAB press
- `COMP_POINT` is set to the correct byte index of the cursor position
- The completion result is correct (confirming both environment variables were passed properly)

### Notes

- `COMP_POINT` is a byte index, not a character index. For ASCII input, they're the same, but the distinction matters if you handle multibyte characters.
- These environment variables should only be set for the completer process, not persisted in your shell's own environment.
