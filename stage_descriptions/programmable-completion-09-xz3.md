Several completer candidates may share more text than the user has typed. In this stage, you'll extend the current word to their longest common prefix.

### Longest common prefix completion

When a completer returns multiple candidates, there are two cases to handle:

- If their shared starting text is longer than the current word: complete that word to the LCP, without a trailing space
- If there is no additional shared text: ring the bell on the first tab and list matches on subsequent tab presses, as before

For example, if the completer returns `checkout` and `cherry-pick` and the user has typed `c`:

```bash
$ git c<TAB>
$ git che
```

Both candidates start with `che`, so the shell completes to `che` and waits for more input. It neither rings the bell nor displays a candidate list for this completion.

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

- Use the candidates returned by the completer for that Tab press. Invoke it again with the updated context when the user types more text and presses Tab again.
- If the LCP is equal to what the user has already typed (no new characters to add), treat it the same as no common prefix: ring the bell and display candidates on the next TAB.
