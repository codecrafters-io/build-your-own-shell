File persistence makes the in-memory history from the History extension available across shell sessions. In this stage, you'll load saved commands with `history -r <path_to_history_file>`.

### The history file

This builds on the history list and listing behavior you added in the History extension.

The file contains one command per line, without history numbers or prompts. Loading appends those commands to the in-memory list in file order. It does not execute them or replace commands already in the list.

Record `history -r <path_to_history_file>` itself before appending the loaded commands. A successful load produces no output.

In file examples, `<|EMPTY LINE|>` marks the trailing newline after the last command. Those characters are an annotation and must not appear in the file. Likewise, `<path_to_history_file>` stands for the actual file path chosen by the tester.

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
