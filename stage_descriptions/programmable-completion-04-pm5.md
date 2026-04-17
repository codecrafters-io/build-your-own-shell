In this stage, you'll add support for `-C` option in the `complete` builtin.

### Command-based programmable completion

The `complete` builtin supports `-C`, which registers an external command that your shell should run when tab completion is requested for a specific command name.

If the user runs `complete -C /path/to/docker_completer_script.py docker`, the shell registers that completion rule and prints nothing.

When the user later types `docker ` and presses tab, the shell runs the registered completer script, reads its stdout, and uses that output as completion candidates. The completer script can be in any language.

A high-level flow looks like this:
1. The user types a partial command and presses tab.
2. The shell intercepts the tab keypress.
3. The shell looks up the completion rule for that command name and finds the `-C` rule.
4. The shell starts the completer script using `fork()` and `exec()`.
5. The completer script prints completion candidates to stdout.
6. The shell reads the stdout of the completer script.
7. Each line of the stdout is a completion candidate.

The completer script will offer only one completion candidate for this stage.

For example, the completer script that offers `run` completion can look like this:

```python
#!/usr/bin/env python3
print("run")
```

```bash
$ complete -C /path/to/completer/script.py docker
$ docker <TAB>
# Since the completer script only offers 'run' as the completion option
# It autocompletes to 'run' with a trailing space
$ docker run
```

In this stage, you only need to support a completer that prints a single candidate word each time.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

The tester will create a completer script that will always print the following:
```
run
```

It will register a command-based completion rule.

```bash
$ complete -C /path/to/completer/script.py docker
$ 
```

The tester will then type `docker ` and press tab.

```bash
$ docker <TAB>
# Autocompletes to run because the completion
# offers 'run' as the only option
$ docker run
```

The tester will verify that tab completion uses the completer script output and inserts the single returned word with a trailing space.

### Notes

- The completer script will print a single line to stdout. 

- You do not need to support passing extra completion context into the completer yet. We'll add those details in later stages.
