The REPL needs a way for the user to end the session. In this stage, you'll implement the `exit` builtin.

### The `exit` builtin

The [`exit`](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#exit) builtin terminates the shell. [Builtin commands](https://app.codecrafters.io/concepts/what-are-builtin-commands) are operations the shell implements itself. A process is a running instance of a program. Handling a builtin doesn't require launching a separate program.

When your shell receives the `exit` command, it should terminate immediately instead of displaying another prompt.

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
