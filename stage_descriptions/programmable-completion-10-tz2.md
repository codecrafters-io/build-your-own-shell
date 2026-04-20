In this stage, you'll add support for removing completion rules with `complete -r`.

### The `-r` Option

The `complete` builtin accepts a `-r` flag followed by a command name. This removes any stored completion rule for that command. After removal, pressing TAB for that command should behave as if no completion was ever registered.

```bash
$ complete -C /path/to/completer_script git
$ git ch<TAB>
$ git checkout             # completion works

$ complete -r git
$ git ch<TAB>              # bell rings, no completion
```

The command should produce no output on success, just like registering a rule.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will register a completion, unregister it with `-r`, confirm via `-p` that the rule is gone, then attempt completion again.

```bash
$ complete -C /path/to/completer_script git
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

- If `complete -r` is called for a command that has no completion registered, the shell should still produce no output and not treat it as an error.
