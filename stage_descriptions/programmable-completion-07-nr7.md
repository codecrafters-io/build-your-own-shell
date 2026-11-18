Some completers need the full input line and cursor position as well as individual words. In this stage, you'll supply `COMP_LINE` and `COMP_POINT` in their environment.

### Completion environment variables

In earlier stages, you passed the command name, current word, and previous word as arguments to the completer. Some completers also need to know the full command line and where the cursor is. Your shell should set two environment variables before invoking the completer:

- `COMP_LINE` contains the command line when TAB is pressed, without the shell prompt or a trailing newline.
- `COMP_POINT` contains the zero-based byte index of the cursor position in `COMP_LINE`, written as decimal text. At the end of the line, it equals the line's byte length.

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
$ ./your_program.sh
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

- For ASCII input, byte and character counts are the same. Multibyte characters make those counts differ, so `COMP_POINT` must measure bytes.
- Supply these variables in the completer process's environment. Leave the shell's own environment unchanged.
