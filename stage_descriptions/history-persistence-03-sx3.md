Appending new commands preserves history already saved in a file. In this stage, you'll add `history -a <path_to_history_file>` without duplicating previously appended entries.

### Appending new entries

The first append writes commands entered in this session, including the `history -a` command. Later appends write only entries added since the previous append, including each new `history -a` invocation. Keep the existing one-command-per-line format and trailing newline.

### Tests

The tester will write the following commands to the history file:

```txt
echo initial_command_1
echo initial_command_2
<|EMPTY LINE|>
```

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send the following commands to your shell:

```bash
$ echo new_command
new_command
$ history -a <path_to_history_file>
$
```

The tester will then expect the history file's contents to include the new commands:

```txt
echo initial_command_1
echo initial_command_2
echo new_command
history -a <path_to_history_file>
<|EMPTY LINE|>
```

### Notes
- The tester will expect the `history -a` command to also be present in the history file.
- A successful append produces no terminal output.
