In this stage, you'll add support for filename completion when typing arguments.

### Filename Completion

Filename completion is a shell feature that helps users complete filename arguments by pressing the `<TAB>` key.

When the user presses `<TAB>` while typing an argument:

1. Extract the text after the last space in the input (e.g., `"re"` in `"cat re"`). This is the partial filename argument.
2. Search the current directory for files that start with that prefix.
3. If a file matches, complete it and add a trailing space.

For example:

```bash
$ cat re<TAB>
$ cat readme.txt 
#                ^ note the trailing space
```

The trailing whitespace lets the user immediately start typing the next argument without manually adding a space.

### Tests

The tester will create a file in the current directory (e.g., `readme.txt`) and execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input with a partial filename:

```bash
$ cat re<TAB>
$ cat readme.txt 

$ cat hello<TAB>
$ cat hello_world.py 
```

The tester will verify that:

- Pressing tab completes the partial filename to the full filename
- A trailing space is added after the filename

### Notes

- For this stage, you only need to match the prefix against files in the current working directory. We'll implement completion in nested directories in later stages.
- For this stage, you only need to handle cases of a single matching filename. We'll implement directory completion and multiple completions in later stages.
- The completion works for any command, not just `cat`. For example, even for a nonexistent command like `xyz`, pressing tab should still complete the argument: `xyz read<TAB>` becomes `xyz readme.txt `.
