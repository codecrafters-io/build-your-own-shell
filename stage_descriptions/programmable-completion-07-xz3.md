In this stage, you'll extend `-C` programmable completion using the longest common prefix (LCP) of the matching words.

### Longest common prefix for command-based completion

When multiple matches exist:
- If they share a prefix longer than the current input: complete to the LCP
- If they don't: ring the bell on the first tab, list matches on subsequent tab presses (like in previous stages)

For example, if the completer script prints `checkout`, `cherry-pick`, on separate lines.

```bash
$ complete -C /path/to/completer_script git
$ git ch<TAB>
$ git che
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will register a command-based completion rule for a command such as `git` and simulate tab presses on a partial subcommand. The completer script will print the same two newline-separated words as in the `-C` example above.

```bash
$ complete -C /path/to/completer_script git
# Silent No output
$ git c<TAB>
# Extend to LCP 'che'
# Because the options are: 'checkout' and 'cherry-pick'
$ git che<TAB>
# Press 'c' and press tab
# Autocompletes to checkout with a trailing space
$ git chec<TAB>
$ git checkout 
```
