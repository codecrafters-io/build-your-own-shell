In this stage, you'll implement the `type` builtin command for your shell.

The `type` builtin is used to determine how a command would be interpreted if used. Example:

```bash
$ type echo
echo is a shell builtin
$ type exit
exit is a shell builtin
$ type invalid_command
invalid_command: not found
```

In this stage we'll only test two cases: builtin commands and unrecognized commands. We'll handle
executable files in later stages.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `type` commands to your shell:

```bash
$ type echo
echo is a shell builtin
$ type exit
exit is a shell builtin
$ type type
type is a shell builtin
$ type invalid_command
invalid_command: not found
$
```

The tester will check if the `type` command responds correctly based on the command provided:

- If a command is a shell builtin, the expected output is `<command> is a shell builtin`.
- If a command is not recognized, the expected output is `<command>: not found`.

### Notes

- The tester will only check for builtin commands and unrecognized commands in this stage.
- `type` itself is a shell builtin command, so `$ type type` should print `type is a shell builtin`.