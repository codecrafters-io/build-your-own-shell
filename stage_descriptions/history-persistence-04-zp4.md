In this stage, you'll ensure that your shell loads history from the file into memory on startup.

### The `HISTFILE` environment variable

The [`HISTFILE` environment variable](https://www.gnu.org/software///bash/manual/bash.html#index-HISTFILE) specifies the path to the history file. 
It is the path used to load history from the file into memory on startup and to save the in-memory history to the file when exiting.


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