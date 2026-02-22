In this stage, you'll handle tab completion when an entry has multiple matches.

### Handling Multiple Matches

When multiple files or directories match the current prefix:
1. First `<TAB>`: Ring the bell (`\x07`) to indicate multiple matches exist
2. Subsequent `<TAB>` presses: List all matches in alphabetical order on a new line, then redisplay the prompt

When listing matches:
- Separate entries with at least one space (two spaces are recommended for readability)
- Show directories with a trailing `/`
- Show files without any trailing character

For example, with entries `bar.txt` and `foo/`:
```bash
$ stat <TAB>
# Bell rings, no change to input
$ stat <TAB>
bar.txt  foo/
$ stat 
```

Since the original input remains on the prompt, the user can continue typing to narrow down the matches.

### Tests

The tester will create multiple entries (e.g., `bar.txt` and `foo/`) and execute your program like this:
```bash
$ ./your_program.sh
```

It will then simulate user input:
```bash
$ stat <TAB><TAB>
bar.txt  foo/
$ stat 
```

The tester will verify that:
- The first tab press rings the bell
- Subsequent tab presses display all matching entries:
  - The matches are sorted alphabetically
  - The matches are separated by at least one space
  - Directories are shown with a trailing `/`
  - The matches are displayed on a new line
- The prompt reappears with the original input preserved
