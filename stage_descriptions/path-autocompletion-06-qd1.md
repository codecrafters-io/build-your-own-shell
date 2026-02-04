In this stage, you'll implement tab completion for multiple files and directories.

### Handling Multiple Matches

When multiple files or directories match the current prefix:

1. First `<TAB>`: ring the bell (`\x07`) to indicate ambiguity.
2. Second `<TAB>`: list all matches in alphabetical order, separated by spaces, on a new line.
3. The original input remains on the prompt for continuation.

For example:

```bash
$ stat ./<TAB><TAB>
bar  foo/
$ stat ./
```

### Tests

The tester will create multiple entries inside a directory. Eg.

- `bar`
- `foo/`

```bash
$ ./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ stat ./<TAB><TAB>

# After 2 tab presses
bash-3.2$ stat ./
bar  foo/
```

The tester will verify that:
1. The first tab press rings the bell.
2. The second tab press displays all matching entries in alphabetical order.
    - The matches are separated by at least one space.
    - The matches are displayed on a new line.
3. The prompt reappears with the original input preserved.
