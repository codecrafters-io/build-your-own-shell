In this stage, you'll add support for writing the in-memory history to the history file when exiting.

### Tests

The tester will execute your program like this:

```bash
HISTFILE=<path_to_history_file> ./your_program.sh
```

It will then send the following commands to your shell:

```bash
$ echo hello
hello
$ echo world
world
$ exit 0
```

The tester will then expect the history file's contents to look like:

```txt
echo hello
echo world
exit 0
<|EMPTY LINE|>
```