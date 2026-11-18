A registered completer may have no suggestions for the current input. In this stage, you'll handle an empty result by preserving the input and ringing the bell.

### Handling empty completer output

When the completer script prints nothing to stdout, your shell has no candidates to work with. In that case, the shell should:

- Leave the input unchanged
- Ring the terminal bell by printing `\x07` to stdout

This gives the user feedback that their TAB press was received but no completion was available.

The bell is the control byte `\x07`. A terminal may turn it into a beep or a flash, depending on its settings.

An empty result from a registered completer is final for that Tab press. Use the earlier fallback behavior only when the command has no registered completer.

For example, a completer that always exits without printing anything:

```python
#!/usr/bin/env python3
exit(0)
```

When registered and triggered with TAB, your shell should just ring the bell and leave the input untouched:

```bash
$ complete -C /path/to/completer_script docker
$ docker xyz<TAB>
# bell rings, input line stays as "docker xyz"
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will supply a completer script that prints nothing, register it for a command, and press TAB:

```bash
$ complete -C /path/to/completer_script docker
$ docker xyz<TAB>
# bell rings, input unchanged
```

The tester will verify that:

- The input line is unchanged after the TAB press
- The bell character (`\x07`) is printed to stdout
