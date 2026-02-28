In this stage, you'll add support for limiting the number of history entries.

### The `history <n>` Command

The `history` command can take an optional number argument to limit the number of entries displayed. When the user runs `history <n>`, your shell should show the last `n` commands from the history.

For example, `history 2` shows the two most recent commands:

```bash
$ echo first
first
$ echo second
second
$ echo third
third
$ history 2
    2  echo second
    3  echo third
    4  history 2
$
```

Here, the `history 2` command displays the two most recent commands (including the `history` command itself).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the `history <n>` command, which displays the last n commands:

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

- The `history` command should include itself in the history list.
- In Bash, `history <n>` means "show the last n commands". Some shells like _zsh_ interpret this differently (as "show entries starting from line n"), but for this challenge, use the Bash interpretation.
