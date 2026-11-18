Saving history produces a file that another session can load. In this stage, you'll write the in-memory history with `history -w <path_to_history_file>`.

### Writing the history list

Write the entire list in order, replacing any existing file contents. Use one command per line without history numbers or prompts, and end the file with a newline. Include the `history -w` command itself. A successful write produces no terminal output.

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
