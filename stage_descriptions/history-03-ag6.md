Users may want to inspect recent commands without printing the whole history. In this stage, you'll limit the displayed list with `history <n>`.

### The `history <n>` command

The `history` command can take an optional number argument to limit the number of entries displayed. When the user runs `history <n>`, your shell should show the last `n` commands from the history.

For example, `history 2` shows the two most recent commands:

```bash
$ echo first
first
$ echo second
second
$ history 2
    2  echo second
    3  history 2
$
```

Here, the `history 2` command displays the two most recent commands (including the `history` command itself).

Keep each entry's original number. Selecting the last entries must not renumber them or delete older commands from history.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the `history <n>` command:

```bash
$ echo hello
hello
$ echo world
world
$ invalid_command
invalid_command: command not found
$ history 2
    3  invalid_command
    4  history 2
$
```

The tester will verify that:
- The output shows the last `n` commands
- Each entry is numbered correctly
- The `history` command itself appears in the history

### Notes

- In Bash, `history <n>` means "show the last n commands". Some shells like _zsh_ interpret this differently (as "show entries starting from line n"), but for this challenge, use the Bash interpretation.
