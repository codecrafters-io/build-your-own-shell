In this stage, you'll extend path completions to the command position.

### The command position

The command position is the first word of the input line. All words that come after the command are in argument position.
Example:

```bash
$ echo hello
  ^^^^
  command position

$ echo hello world
       ^^^^^ ^^^^^
       argument position
```

Up until now, we have been dealing with path completions in the argument position.

In the command position, the autocomplete feature works as follows:
- If the typed prefix is not a path (does not contain a slash), command autocompletion is invoked.
- If the typed prefix is a path (contains a slash), only directories and executables matching the prefix are considered.

For this stage, the tester will only deal with path completion, and not command completion.

For example:
```bash
# Command prefix is a bare command
$ e<TAB>
$ echo 

# Command prefix is a path
$ ./s<TAB>
$ ./script.sh

# Command prefix is a directory
$ ./f<TAB>
$ ./foo/

```

### Tests

The tester will create the following entries inside a directory `/tmp/test_dir`:

- `file.txt`
- `foo/hello.sh` (With executable permissions)
- `script.sh` (With executable permissions)

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then test tab completion as follows:

```bash
$ /tmp/test_dir/<TAB>
foo/  script.sh
$ /tmp/test_dir/

# Another tab press after pressing 'f'
$ /tmp/test_dir/f<TAB>

# In the same line
$ /tmp/test_dir/foo/

# Another tab press
$ /tmp/test_dir/foo/<TAB>

# In the same line
$ /tmp/test_dir/foo/hello.sh
```

The tester will verify that:

- First `<TAB>` after `/tmp/test_dir/`
  - Rings the bell (`\x07`) because multiple matches exist.

- Second `<TAB>`
  - Lists all matches in alphabetical order (`foo/` and `script.sh`).
  - Only directories and executable files are shown (command-position logic).
  - Original input remains on the prompt, displayed on a new line.

- Pressing `<TAB>` after typing `f` (`/tmp/test_dir/f<TAB>`)
  - Completes to the longest matching prefix (`foo/`).
  - Trailing `/` is added because it is a directory.

- Pressing `<TAB>` after `foo/` (`/tmp/test_dir/foo/<TAB>`)
  - Completes the nested path to `hello.sh`.
  - Trailing space is added because it is a file.
