In this stage, you'll implement a [REPL (Read-Eval-Print Loop)](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop).

A REPL is an interactive loop that reads user input, evaluates it, prints the result, and then waits for the next input.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of commands to your shell:

```bash
$ invalid_command_1
invalid_command_1: command not found
$ invalid_command_2
invalid_command_2: command not found
$ invalid_command_3
invalid_command_3: command not found
$
```

After each command, the tester will check if `<command_name>: command not found` is printed, and whether a prompt is printed for the next command.

### Notes

- The exact number of commands sent and the command names will be random.
- Just like the previous stages, all commands will be invalid commands, so the response will always be `<command_name>: command not found`.