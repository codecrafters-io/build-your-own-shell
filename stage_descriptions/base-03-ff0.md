Your shell currently handles one command. In this stage, you'll keep accepting commands with a [REPL (Read-Eval-Print Loop)](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop).

### The REPL

A REPL repeats the interaction between the user and the shell:

1. **Read**: Display a prompt and wait for user input
2. **Eval**: Parse and execute the command
3. **Print**: Display the output or error message
4. **Loop**: Return to step `1` and wait for the next command

For now, evaluation still treats every command as unrecognized. After printing `<command_name>: command not found`, display `$ ` again and wait for another line. For example, `hello` produces `hello: command not found` followed by a new prompt.

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

After each command, the tester will verify that your shell:
- Prints the message `<command_name>: command not found`.
- Displays a new prompt (`$ `) before the tester sends the next command

### Notes

- The exact number of commands sent and the command names will be random.
- The loop should run indefinitely. The tester will terminate your program when the test is complete.
