In this stage, you'll register `complete` as a shell builtin.

### The `complete` Builtin

The [`complete`](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html#index-complete) builtin lets users register programmable completions for commands.

For example, you can register a completer script for `git`:

```bash
$ complete -C /path/to/completer_script git
```

Once registered, the shell will invoke the script when the user presses TAB after `git` to get suggestions:

```bash
$ git clo<TAB>
$ git clone 
```

For this stage, you only need to register `complete` as a builtin so that it's recognized by the `type` command. We'll get to implementing the actual behavior in later stages.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then check that `complete` is recognized as a builtin:

```bash
$ type complete
complete is a shell builtin
```

### Notes

- You don't need to implement any completion logic in this stage. Just register `complete` so it shows up as a builtin.
- If your shell already uses a list or map of builtins (e.g., `echo`, `cd`, `pwd`), you can add `complete` to that same structure.
