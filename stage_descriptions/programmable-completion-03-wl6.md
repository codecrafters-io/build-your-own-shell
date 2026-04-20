In this stage, you'll add support for the `-C` flag to register completions and extend `-p` to display the completions.

### Registering and Displaying Completions

The `-C` flag tells `complete` to register a completer script for a command. Once a completion is registered, `complete -p <command>` should print it back in a normalized format.

```bash
$ complete -C /path/to/git/completer git
$ complete -p git
complete -C '/path/to/git/completer' git

$ complete -C /path/to/docker/completer docker
$ complete -p docker
complete -C '/path/to/docker/completer' docker
```

Two things to note about the output format:

- The script path is wrapped in single quotes
- Arguments are separated by exactly one space, regardless of how the registration command was written

So even if the user registers with extra whitespace, the output is always clean:

```bash
$ complete   -C    /path/to/git/completer   git
$ complete -p git
complete -C '/path/to/git/completer' git
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will register completions with `-C` (sometimes using extra whitespace) and then query them with `-p`:

```bash
$ complete  -C  /path/to/completer/script  git
$ complete -p git
complete -C '/path/to/completer/script' git

$ complete   -C /path/to/docker/completer    docker
$ complete -p docker
complete -C '/path/to/docker/completer' docker
```

The tester will verify that:

- `complete -C <path> <command>` registers the completion and produces no output
- `complete -p <command>` prints the registered completion in the format `complete -C '<path>' <command>`
- The output uses single quotes around the path and single spaces between arguments

### Notes

- In earlier stages, `complete -p <command>` printed `complete: <command>: no completion specification`. That error is still the correct response when no completion has been registered for the given command.
- Don't echo back the original `complete -C` command. Parse the arguments, store them, and reconstruct the output in the normalized format.
- The single quotes around the path are literal characters in the output.






