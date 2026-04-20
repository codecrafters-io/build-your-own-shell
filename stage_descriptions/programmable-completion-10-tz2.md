In this stage, you'll support the `-r` option on the `complete` builtin.

### The `-r` option

The `complete` builtin accepts `-r` followed by a command name. The shell drops any stored completion rule for that name. After that, tab completion for that command behaves as if nothing had been registered.

Running `complete -r` with a command name should produce no output on success, the same as registering a rule.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will register a completion, unregister it with `-r`, confirm via `-p` that the rule is gone, then attempt completion again.

```bash
$ complete -C '/path/to/completer/script' git
$ complete -r git
$ complete -p git
complete: git: no completion specification
# Expect: Bell to ring
$ git <TAB>
```

The tester will verify that:
- `complete -p git` prints `complete: git: no completion specification` after unregistering
- Tab completion for `git` no longer works and the bell rings

### Notes

If `complete -r` is run for a command that has no completion registered, the shell should still print nothing and not treat it as an error.
