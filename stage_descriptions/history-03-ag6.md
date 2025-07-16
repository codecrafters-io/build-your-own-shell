In this stage, you'll add support for limiting history entries using the `history <n>` syntax.

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

The tester expects the history list to be limited to the last `n` commands.

### Notes

- The tester expects the history command to be present in the history list.