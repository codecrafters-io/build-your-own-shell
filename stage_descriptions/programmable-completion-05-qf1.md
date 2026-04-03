In this stage, you'll add support for handling the completer script's stderr

### Streaming completer's stderr

Anything the completer writes to standard error must appear on the user's terminal exactly as written (same bytes, same line breaks). The shell must copy standard error to the terminal as it becomes available while the completer is still running. It must not buffer standard error until the completer process exits.

The tester may use a completer that writes known lines to standard error and then sleeps for a long time so the process stays alive. For example:

```python
#!/usr/bin/env python3
import sys
import time

print("Line1", file=sys.stderr, flush=True)
print("Line2", file=sys.stderr, flush=True)
print("Line3", file=sys.stderr, flush=True)
time.sleep(100)
```

Those three lines must be visible on the terminal during completion, before the long sleep finishes and before the process exits.

For example:

```bash
$ complete -C /path/to/completer_script git
$ git <TAB>
```

```bash
$ git Line1
Line2
Line3
```

- The bell does not ring because the process have not exitted yet so the shell cannot determine if completion candidates exist or not.

- The lines written to standard error show on the terminal as they are produced, without waiting for the completer to finish.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will create a completer script that prints contents to stdout, but does not exit. For example:
```python
#!/usr/bin/python3
import sys
import time

print("Line1", file=sys.stderr)
print("Line2", file=sys.stderr)
print("Line3", file=sys.stderr)
time.sleep(120)
```

It will register a command-based completion rule for a command such as `git`. The `complete` command should produce no output.

```bash
$ complete -C /path/to/completer_script git
$
```

```bash
# Expect: bell; standard error visible during completion; input line unchanged
$ git <TAB>
```

The tester will verify that:

- The input line is unchanged after the tab press
- That the bell character is not printed to standard output because the process have not completed yet and the shell cannot determine if completion candidates exist.
- Text from the stderr of the completer appears on the terminal unchanged while the completer is still running.
