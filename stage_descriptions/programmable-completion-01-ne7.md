In this stage, you'll add support for the `complete` builtin.

### The `complete` Builtin

The [`complete`](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html#index-complete) builtin lets the shell register and list programmable completions for commands.

For example:

```bash
# Register the script as the completer script for the 'git' command
$ complete -C /path/to/completer/script git
# Make use of the registered completion
$ git clo<TAB>
# Autocompletes to 'git clone'
$ git clone 
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then use the `type` builtin on `complete`

```bash
# Expect: complete is a shell builtin
$ type complete
complete is a shell builtin
```

The tester will also type the `complete` built-in to the shell.

```bash
# Expected: No output
$ complete
$ 
```

### Notes

- In this stage, you'll register `complete` as a builtin and write an empty implementation for it. You don't need to write the actual implementation of it yet. We'll get to that in the later stages.