Loading saved history at startup avoids a manual `history -r` in every session. In this stage, you'll load the file named by `HISTFILE` automatically.

### The `HISTFILE` environment variable

The [`HISTFILE` environment variable](https://www.gnu.org/software///bash/manual/bash.html#index-HISTFILE) supplies the history file's path. When it is set, load that file's commands into memory before accepting the first command. Use the file format from earlier stages and retain the commands without executing them.

New commands follow the loaded entries in history. This stage covers loading on startup. Automatically saving to the same path on exit comes next.


### Tests

The tester will write the following commands to the history file:

```txt
echo hello
echo world
<|EMPTY LINE|>
```

The tester will execute your program like this:

```bash
HISTFILE=<path_to_history_file> ./your_program.sh
```

It will then send the following commands to your shell:

```bash
$ history
    1  echo hello
    2  echo world
    3 history
$
```
