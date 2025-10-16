In this stage, you'll implement the `exit` builtin.

### The `exit` Builtin

The [exit](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#exit) builtin is a special command that terminates the shell.

It takes an optional numeric argument as the shell's [exit status](https://en.wikipedia.org/wiki/Exit_status):
```bash
$ exit 0    # Exit with status 0 (success)
$ exit 1    # Exit with status 1 (error)
```

When your shell receives the `exit` command, it should terminate immediately with the specified exit code.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send an invalid command to your shell, followed by the `exit` command:

```bash
$ invalid_command_1
invalid_command_1: command not found
$ exit 0
```

The tester will verify that:
- Your shell terminates after receiving the `exit` command
- Your shell exits with status code `0`

### Notes

- The tester will always pass in `0` as the argument to the `exit` command.
