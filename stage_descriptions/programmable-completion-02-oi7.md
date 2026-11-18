A completion specification records which script supplies suggestions for a command. In this stage, you'll add `complete -p` to report a missing specification.

### The `-p` flag

The `-p` flag prints the completion specification registered for a given command. A specification records which completer script belongs to that command. Once registration is implemented, a successful query will look like this:

```bash
$ complete -p git
complete -C '/path/to/git/completer' git
```

When no specification has been registered, it prints an error message in this format:

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
