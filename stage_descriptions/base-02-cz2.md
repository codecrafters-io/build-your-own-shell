Your shell can print a prompt but doesn't yet respond to input. In this stage, you'll read one command and report that it isn't recognized.

### Unrecognized commands

Your program should:

1. Display the prompt `$ ` (keep the code from earlier stages)
2. Read the user's input
3. Print an error message in exactly this format: `{command}: command not found`
   - e.g. if the user types `xyz`, print `xyz: command not found`

For now, treat every command as unrecognized. Running commands such as `echo` and `cd` comes later. You only need to handle one input line in this stage.

### Tests

The tester starts your shell with `./your_program.sh` and sends a command such as `xyz`. It expects the command name followed by `: command not found`:

```
$ xyz
xyz: command not found
```
