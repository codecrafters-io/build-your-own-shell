In this stage, you’ll add support for directory name  completion for command argument.

### Directory Name Completion
When the user presses `<TAB>` while typing an argument:

1. If the typed prefix matches a directory name, 
2. Complete the directory name and add a trailing slash and no space

### Tests

The tester will create a single directory in the working directory, eg. `foo`.

The tester will then execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ ls fo<TAB>

# In the same line
# Without trailing space
$ ls foo/
```

The tester will verify that:

- Pressing tab after `ls foo` completes to `ls foo/`
- No trailing space is inserted after the slash character since the completion was made for a directory.

### Notes

- In this stage, you'll only need to handle cases of single matching completion, we'll get to implementing multiple completions in the later stages.

- The argument completion does not depend on the command.