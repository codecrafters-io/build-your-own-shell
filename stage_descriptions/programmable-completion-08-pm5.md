In this stage, you'll handle a `-C` completer that returns no candidates.

### Empty output from the completer

When the user presses tab and the shell runs the registered completer script, the shell reads stdout and treats each non-empty line as a candidate. If the completer prints nothing to stdout, or only blank lines, there are no candidates to apply.

In that case the shell should not insert text or replace the current word. It should print the bell character (`\x07`) to standard output, the same as when programmable completion cannot advance the line.

For example:

```bash
$ complete -C /path/to/completer_script git
$ git xyz<TAB>
# Bell (\x07); line unchanged
```

The completer script produces no usable lines for that tab press.

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

The tester will supply a completer script that prints no candidates for the scenario below (empty stdout or no non-empty lines).

```bash
# Expect: Bell to ring
$ git xyz<TAB>
```

The tester will verify that the input line is unchanged after the tab press and that the bell character is printed to standard output.
