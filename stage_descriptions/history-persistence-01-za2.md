In this stage, you will read history from a file using the `history -r <path_to_history_file>` command.

### Tests

The tester will write the following commands to the history file:

```txt
echo hello
echo world
<|EMPTY LINE|>
```

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send the following commands to your shell:

```bash
$ history -r <path_to_history_file>
$ history
    1  history -r <path_to_history_file>
    2  echo hello
    3  echo world
    4  history
$
```

### Notes
- The tester will expect the history commands to also be present in the history list.
- `history -r` should append the history file's contents to the history list in memory.