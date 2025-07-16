In this stage, you'll implement the `history` builtin.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the `history` command:

```bash
$ echo hello
hello
$ echo world
world
$ invalid_command
invalid_command: command not found
$ history
    1  echo hello
    2  echo world
    3  invalid_command
    4  history
$
```

The tester expects a history list with the commands that were executed, formatted and indexed like in the example above.

### Notes

- Some shells like *zsh* don't add the `history` command to the history list, but the tester expects it to be present.