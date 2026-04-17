In this stage, you'll add support for the `-p` flag for the `complete` builtin.

### The `-p` flag

The `-p` flag prints the completion specification registered for a given command in a reusable format.

If no specification has been registered, the shell prints an error message indicating there's no completion specification for that command.

For example:

```bash
# See the autocompletion specification for the 'git' command
$ complete -p git
complete: git: no completion specification
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then use the `-p` flag with the `complete` builtin.

```bash
$ complete -p git
complete: git: no completion specification
```

### Notes

- You can hardcode the output for this stage. We'll get to keeping track of completion specifications in the later stages.