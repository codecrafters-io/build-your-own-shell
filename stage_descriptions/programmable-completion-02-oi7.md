In this stage, you'll add support for displaying the registered completion using the `complete` builtin.

### The `complete` Builtin

The [`complete`](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html#index-complete) builtin lets the shell register and list programmable completions for commands.

The `complete` builtin without any flags displays the completions registered so far.

For example:

```bash
# Register the script as the completer script for the 'git' command
$ complete -C /path/to/completer/script git
# Make use of the registered completion
$ complete
complete -C /path/to/completer/script git
$
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then use the `complete` builtin to list the registered completions.

```bash
# Registration command may have spaces between arguments
$ complete  -C  /path/to/completer/script  git
# Output should not have spaces between arguments
# The path should be surrounded with single quotes
$ complete
complete -C '/path/to/completer/script' git
```

### Notes

- You should parse the arguments and display them in the correct format while displaying the output of the `complete` builtin and not copy the command used to register the completion.