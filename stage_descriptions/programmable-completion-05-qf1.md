In this stage, you'll handle the case where the completer script returns no candidates.

### Handling Empty Completer Output

When the completer script prints nothing to stdout, your shell has no candidates to work with. In that case, the shell should:

- Leave the input unchanged
- Ring the terminal bell by printing `\x07` to stdout

This gives the user feedback that their TAB press was received but no completion was available.

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
