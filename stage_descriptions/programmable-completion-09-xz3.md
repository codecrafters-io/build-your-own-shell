In this stage, you'll complete to the longest common prefix (LCP) when multiple candidates share one.

### Longest Common Prefix Completion

When a completer returns multiple candidates, there are two cases to handle:

- If they share a prefix longer than the current input: complete to the LCP
- If they don't: ring the bell on the first tab, list matches on subsequent tab presses (like in previous stages)

For example, if the completer returns `checkout` and `cherry-pick` and the user has typed `c`:

```bash
$ git c<TAB>
$ git che
```

Both candidates start with `che`, so the shell completes to `che` and waits for more input. No bell, no candidate list.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will register a completer script that returns `checkout` and `cherry-pick`:

```bash
$ complete -C /path/to/completer_script git
$ git c<TAB>
$ git che                  # LCP of checkout and cherry-pick
$ git chec<TAB>
$ git checkout             # only one match now, completes fully with trailing space
```

The tester will verify that:

- The first TAB completes to the longest common prefix when one exists
- When only one candidate remains, TAB completes the full word with a trailing space
- No bell rings when the LCP extends the current input

### Notes

- The LCP is computed from the candidates returned by the completer, not from a hardcoded list.
- If the LCP is equal to what the user has already typed (no new characters to add), treat it the same as no common prefix: ring the bell and display candidates on the next TAB.
