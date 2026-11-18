A history list records the commands entered during a shell session. In this stage, you'll store those command lines and display them with `history`.

### Recording and listing commands

Record each entered command line in order, including unrecognized commands. Store the command text as entered, without the `$ ` prompt or the command's output. The `history` command itself is included before its list is displayed.

Print entries oldest first, numbered starting at `1`. Each output line contains the entry number followed by its command text, using the spacing shown below.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the `history` command:

```bash
$ echo hello
hello
$ echo world
world
$ invalid_command
invalid_command: command not found
$ history
    1  echo hello
    2  echo world
    3  invalid_command
    4  history
$
```

The tester expects a history list with the commands that were executed, formatted and indexed like in the example above.

### Notes

- Some shells like _zsh_ don't add the `history` command to the history list, but the tester expects it to be present.
- For this extension, storing history in memory is sufficient. History persistence across sessions will be implemented in a separate extension.
