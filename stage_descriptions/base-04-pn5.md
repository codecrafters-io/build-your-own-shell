In this stage, you'll implement the `exit` builtin.

### The `exit` Builtin

The [`exit`](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#exit) builtin is a special command that terminates the shell.

When your shell receives the `exit` command, it should terminate immediately.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send an invalid command to your shell, followed by the `exit` command:

```bash
$ invalid_command_1
invalid_command_1: command not found
$ exit
```

The tester will verify that your shell terminates after receiving the `exit` command.
