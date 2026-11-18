Command history will let users inspect and recall earlier input. In this stage, you'll make `type` recognize [history](https://www.gnu.org/software/bash/manual/html_node/Bash-History-Builtins.html#index-history) as a shell builtin.

### The history builtin

The [history](https://www.gnu.org/software/bash/manual/html_node/Bash-History-Builtins.html#index-history) builtin lists commands entered in the shell. This example shows the eventual listing behavior, which is not required yet:
```bash
$ history
    1  previous_command_1
    2  previous_command_2
    3  history
```

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

The tester will then execute the `type history` command.

```bash
$ type history
history is a shell builtin
$
```

The required result is `history is a shell builtin`. You do not need to store or display a history list in this stage.
