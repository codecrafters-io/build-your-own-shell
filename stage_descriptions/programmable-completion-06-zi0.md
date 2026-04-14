In this stage, you'll pass completion context into a `-C` completer using the command-line arguments.

### Passing arguments to the completer

In order for the completer script to know which completion candidates to offer for autocompletion, it must receive the context of what is being typed. So, when the shell runs a registered completer command, it invokes it with exactly three arguments, in this order:

1. `argv[1]` — The command name whose completion is active (the same name passed to `complete`, for example `git`).

2. `argv[2]` — the word currently being completed (the partial token the user is typing at the cursor).

3. `argv[3]` — the word immediately before the word being completed on the command line. If there is no preceding word, pass an empty string.

The completer can use these values to decide what to print to stdout. Each line of stdout is still one completion candidate.

For example, if the completer script is like this:

```python
# Write a simple completer script based on argv[2] with matching prefix
# Must offer only for 'add cherry-pick commit push'
```

```bash
$ complete -C /path/to/completer_script git
$ git cher<TAB>
$ git cherry-pick 
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will register a command-based completion rule. The `complete` command should produce no output.

```bash
$ complete -C /path/to/completer_script git
# Should autocomplete to remove followed by a trailing space
$ git remote set<TAB>
$ git remote set-url
```

In the example above:

- `argv[1]`: `git` (Command)
- `argv[2]`: `set` (Current word being completed)
- `argv[3]`: `remote` (Previous word)

The completer script will only work correctly if the proper values of `argv[1]`, `argv[2]`, and `argv[3]` are passed to the completer script.
