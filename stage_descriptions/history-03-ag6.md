In this stage, you'll add support for limiting history entries using the `history <n>` syntax.

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

### Notes

- The tester expects the history command to be present in the history list.
- In some shells like _zsh_, `history <n>` means "show entries starting from line n", whereas the tester (following Bash behavior) expects it to be "show the last n commands".
