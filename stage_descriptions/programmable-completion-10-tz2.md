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
$ ./your_shell.sh
```

It will then register a completion rule, remove it with `-r`, then attempt completion:

```bash
$ complete -C /path/to/completer_script git
$ complete -r git
$ git <TAB>                # bell rings, no completion
```

The tester will verify that:

- `complete -r` produces no output
- TAB completion for the removed command no longer works
- The bell rings when attempting completion on an unregistered command

### Notes

- If `complete -r` is called for a command that has no completion registered, the shell should still produce no output and not treat it as an error.
