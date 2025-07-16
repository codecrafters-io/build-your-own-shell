In this stage, you will add support for writing commands from memory to the history file using the `history -w <path_to_history_file>` command.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send the following commands to your shell:

```bash
$ echo hello
hello
$ echo world
world
$ history -w <path_to_history_file>
$
```

The tester will then expect the history file's contents to look like:

```txt
echo hello
echo world
history -w <path_to_history_file>
<|EMPTY LINE|>
```

### Notes
- If the file doesn't exist when running `history -w`, your shell should create the file and then write the commands to it.
- The tester will expect the `history -w` command to also be present in the history file.
- The history file should include a trailing newline character (displayed as an empty line).