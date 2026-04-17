In this stage, you'll add support for `-C` option in the `complete` builtin and displaying the registered completions.

### Displaying registered completion

The [`complete`](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html#index-complete) builtin lets the shell register and list programmable completions for commands.

The `complete` builtin with the `-p` flag displays the completion registered for the specified command.

For example:

```bash
$ complete -C /path/to/git/completer git
$ complete -C /path/to/docker/completer docker
$ complete -p git
complete -C '/path/to/git/completer' git
$ complete -p docker
complete -C '/path/to/docker/completer' docker
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then use the `complete` builtin to list the registered completions.

```bash
# Registration command may have spaces between arguments
# Output of -p flag should not have spaces between arguments
# The path should be surrounded with single quotes
$ complete  -C  /path/to/completer/script  git
$ complete -p git
complete -C '/path/to/completer/script' git
$ complete   -C /path/to/docker/completer    docker
$ complete -p docker
complete -C '/path/to/docker/completer' docker
```

### Notes

- You should parse the arguments and display them in the correct format while displaying the output of the `complete -p` and not copy the command used to register the completion.