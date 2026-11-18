Removing a custom completer restores any other completion behavior your shell supports. In this stage, you'll remove completion rules with `complete -r` and ring the bell if no fallback candidate exists.

### The `-r` option

The `complete` builtin accepts a `-r` flag followed by a command name. This removes any stored completion rule for that command. After removal, use any other completion behavior your shell supports.

If that fallback produces no candidate, leave the input unchanged and ring the bell (`\x07`). This feedback is now required even if your shell has no other completion implementation, where earlier stages allowed a no-op.

The examples below assume there is no matching fallback completion, so Tab rings the bell after removal:

```bash
$ complete -C /path/to/completer_script git
$ git ch<TAB>
$ git checkout             # completion works

$ complete -r git
$ git ch<TAB>              # bell rings, no completion
```

The command should produce no output on success.

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
- The removed completer no longer supplies candidates. With no fallback match in the test, the input remains unchanged and the bell rings.

### Notes

- If `complete -r` is called for a command that has no completion registered, the shell should still produce no output and not treat it as an error.
