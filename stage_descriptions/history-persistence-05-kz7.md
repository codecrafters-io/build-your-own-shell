Automatic saving lets a later session recover the commands from this one. In this stage, you'll write the in-memory history to `HISTFILE` before exiting.

### Saving before exit

When `HISTFILE` is set, write the history to that path before terminating, using the same file format as `history -w`. Record `exit` before saving so it is included too. This stage's example starts with an empty file. Preserving existing file content through append behavior comes in later stages.

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
$ exit
```

The tester will then expect the history file's contents to look like:

```txt
echo hello
echo world
exit
<|EMPTY LINE|>
```
