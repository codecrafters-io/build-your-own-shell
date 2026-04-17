In this stage, you'll pass completion context to a `-C` completer script as command-line arguments.

### Passing Arguments to the Completer

A completer script needs to know what the user is typing in order to offer relevant suggestions. When your shell invokes a completer registered with `complete -C`, it should pass exactly three arguments:

1. `argv[1]` — The command name being completed (e.g., `git`)
2. `argv[2]` — The word currently being completed (the partial text at the cursor)
3. `argv[3]` — The word immediately before the word being completed. If there's no preceding word, pass an empty string.

The completer script uses these values to decide which candidates to print to stdout (one per line, as before).

For example, given this command line:

```bash
$ git remote set<TAB>
```

Your shell should invoke the completer script with:

- `argv[1]`: `git` (the command)
- `argv[2]`: `set` (the word being completed)
- `argv[3]`: `remote` (the previous word)

The completer script can then use `argv[2]` to filter its candidates by prefix (e.g., returning `set-url` because it starts with `set`).

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will register a completer script for a command:

```bash
$ complete -C /path/to/completer_script git
```

It will then type a partial argument and press TAB:

```bash
$ git remote set<TAB>
$ git remote set-url 
```

The completer script will only return the correct candidate if your shell passes the right values for `argv[1]`, `argv[2]`, and `argv[3]`.

The tester will verify that:

- The completer script receives the command name as `argv[1]`
- The completer script receives the partial word being completed as `argv[2]`
- The completer script receives the preceding word as `argv[3]`
- The completed word replaces the partial text and a trailing space is added

### Notes

- The completer script is already written by the tester. You don't need to create it, just invoke it with the correct arguments.
- If there's no word before the one being completed (e.g., `git <TAB>`), pass an empty string as `argv[3]`.
