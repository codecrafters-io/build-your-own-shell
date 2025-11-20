In this stage, you'll add support for appending the in-memory history to the history file when exiting.

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
