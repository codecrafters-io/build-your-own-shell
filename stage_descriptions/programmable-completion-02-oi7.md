In this stage, you'll add support for the `-p` flag on the `complete` builtin.

### The `-p` Flag

The `-p` flag prints the completion specification registered for a given command. When no specification has been registered, it prints an error message in this format:

```bash
$ complete -p git
complete: git: no completion specification
```

For this stage, you'll only return the error output. You don't need to track any specifications yet, just recognize `-p` and print the error message for whatever command name follows it.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will run `complete -p` with a random command name:

```bash
$ complete -p <command>
complete: <command>: no completion specification
```

The tester will verify that:

- The output matches the format `complete: <command>: no completion specification`
- The command name in the output matches the one passed to `-p`
