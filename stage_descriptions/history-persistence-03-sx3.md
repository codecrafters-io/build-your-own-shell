In this stage, you will add support for appending commands from memory to the history file using the `history -a <path_to_history_file>` command.

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
- Running `history -a` multiple times should only append commands that have been executed since the last time `history -a` was run.