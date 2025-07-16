In this stage, you'll implement the [exit](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#exit) builtin.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send an invalid command to your shell, followed by the `exit` command:

```bash
$ invalid_command_1
invalid_command_1: command not found
$ exit 0
```

After issuing the `exit 0` command, the tester will verify whether your program terminates with [code/status](https://en.wikipedia.org/wiki/Exit_status) 0.

### Notes

- The tester will always pass in `0` as the argument to the `exit` command.