In this stage, you'll implement a [REPL (Read-Eval-Print Loop)](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop).

### The REPL

A [REPL (Read-Eval-Print Loop)](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) is an interactive loop that forms the core of a shell. It follows a repeating cycle:

1. **Read**: Display a prompt and wait for user input
2. **Eval**: Parse and execute the command
3. **Print**: Display the output or error message
4. **Loop**: Return to step `1` and wait for the next command

This cycle continues indefinitely until the shell process is terminated.

Your shell should follow this same cycle:
1. Display the prompt `$ `, then wait for a line of input.
2. Print `<command_name>: command not found` for any command the user enters, like with the previous stages.
3. Return to step `1`.

For example, if the user types `hello`, your shell should print `hello: command not found`, then display the prompt (`$ `) again.

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
