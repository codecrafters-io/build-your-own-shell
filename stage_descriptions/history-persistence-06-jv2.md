Commands loaded at startup are already saved in the history file. In this stage, you'll append only the session's new history entries to `HISTFILE` on exit.

### Preserving saved history

Do not append entries loaded on startup again. Add the new session commands in order, including `exit`, using one command per line and a trailing newline. This applies the incremental append behavior to automatic saving.

### Tests

The tester will write the following commands to the history file:

```txt
echo initial_command_1
echo initial_command_2
<|EMPTY LINE|>
```

The tester will execute your program like this:

```bash
HISTFILE=<path_to_history_file> ./your_program.sh
```

It will then send the following commands to your shell:

```bash
$ echo new_command
new_command
$ exit
```

The tester will then expect the history file's contents to look like:

```txt
echo initial_command_1
echo initial_command_2
echo new_command
exit
<|EMPTY LINE|>
```
