In this stage, you'll implement support for handling invalid commands in your shell.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send the following command to your shell:

```bash
$ invalid_command
invalid_command: command not found
```

The tester will check whether your shell prints `<command_name>: command not found\n` for an invalid command.

### Notes

- We're treating every command as "invalid" for now, but we'll handle executing "valid" commands like `echo`, `cd` etc. in later stages.
- The command name will be a random string, so the response can't be hardcoded.
- In this stage it's okay if your program exits soon after printing the `<command_name>: command not found\n` message. In later stages
  we'll check for a REPL (Read-Eval-Print Loop), i.e. whether the shell prints a new prompt after processing each command.