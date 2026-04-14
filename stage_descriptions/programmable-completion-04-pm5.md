In this stage, you'll handle the case where the completer produces no completion candidates.

### No completion candidates

When the user presses tab and the shell runs the registered completer script, the shell reads standard output and treats line as a candidate. If the completer prints nothing to standard output, there are no candidates to apply.

In that case the shell should not insert text or replace the current word. It should print the bell character (`\x07`) to standard output.

For example:

```bash
$ complete -C /path/to/completer_script git
$ git xyz<TAB>
# Bell (\x07); line unchanged
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will register a command-based completion rule for a command such as `git`. The `complete` command should produce no output.

```bash
$ complete -C /path/to/completer_script git
$
```

The tester will supply a completer script that prints nothing to the stdout. For example, the script might look something like this:

```python
#!/usr/bin/python3
exit(0)
```

```bash
# Expect: bell only; input line unchanged
$ git xyz<TAB>
```

The tester will verify that the input line is unchanged after the tab press and that the bell character is printed to standard output.
