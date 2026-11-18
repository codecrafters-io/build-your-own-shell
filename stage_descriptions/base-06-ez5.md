Users can inspect how the shell would handle a command without running it. In this stage, you'll implement that inspection with the `type` builtin.

### The `type` builtin

The [`type`](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/type.html) builtin distinguishes builtin commands, executable files, and unrecognized names. This stage covers the builtins your shell already knows and names it doesn't recognize.

For example:

```bash
$ type echo
echo is a shell builtin
$ type exit
exit is a shell builtin
$ type invalid_command
invalid_command: not found
```

For this stage, you'll handle two cases:
- For builtin commands (like `echo`, `exit`, and `type`), print `<command> is a shell builtin`.
- For unrecognized commands that don't match any builtin, print `<command>: not found`.

We'll handle executable files in later stages.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of `type` commands to your shell:

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

The tester will verify that:
- Builtin commands print: `<command> is a shell builtin`
- Unrecognized commands print: `<command>: not found`

### Notes

- `type` itself is a shell builtin command, so `$ type type` should print `type is a shell builtin`.
