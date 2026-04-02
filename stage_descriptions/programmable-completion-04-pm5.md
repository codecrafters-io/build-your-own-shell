In this stage, you'll handle the case of no completions and printing the stderr of the completer script to the shell.

### Handling no completions and stderr of completer script

When the user presses tab and the shell runs the registered completer script, the shell reads stdout and treats each line as a candidate. The tester’s completer script will print nothing to stdout for this scenario. If there is nothing in the stdout, there are no completion candidates offered by the script.

In that case the shell should not insert text or replace the current word. It should still print the bell character (`\x07`) to standard output, the same as when programmable completion cannot advance the line.

The same completer may print diagnostic text to stderr. Anything written to stderr by the completer must appear on the shell exactly as written (same bytes, same line breaks), and it must become visible immediately when completion runs (as soon as the user presses tab), not deferred to a later prompt. The shell does not hide or rewrite completer stderr.

For example, if the completer script prints nothing to stdout and writes those lines to stderr:

```python
#!/usr/bin/env python3
import sys

print("Line1", file=sys.stderr)
print("Line2", file=sys.stderr)
print("Line3", file=sys.stderr)
```

Then:

```bash
$ complete -C /path/to/completer_script git
$ git <TAB>
```

```bash
$ git Line1
Line2
Line3
```

- The bell rings (because there are no stdout candidates).
- `Line1`, `Line2`, and `Line3` show on the terminal right away, as printed to stderr.

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

The tester will supply a completer script that prints nothing to stdout and the following to the stderr:

```
Line1
Line2
Line3
```

On tab, that stderr output must show immediately during completion.

```bash
$ git <TAB>
```

```bash
$ git Line1
Line2
Line3
```

The tester will verify that the bell will ring because no completion candidates were offered by the script because no output was there in stdout, and that the lines from stderr are printed as is.
