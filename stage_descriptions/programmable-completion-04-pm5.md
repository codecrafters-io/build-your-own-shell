A stored completion specification becomes useful when the shell runs its script. In this stage, you'll use one candidate from that script's output to complete an argument.

### Running the completer script

You already store script paths with `complete -C`. A completion candidate is a possible replacement for the word being edited. The script supplies candidates through stdout, with one candidate per line.

When the user types a command name followed by a space and presses TAB, run its registered script as a separate process. Its stdout supplies the replacement text. The output's newline separates candidates and isn't inserted into the input line.

If no completer is registered, your shell should fall back to its existing completion behavior (or do nothing if no other completion logic has been implemented yet).

For this stage, the completer will always print exactly one line. Your shell should take that line and complete the user's input with it, followed by a trailing space.

Tab edits the pending command. It does not execute that command. The successive prompt lines below show the same line before and after completion.

For example, a completer script could be as simple as this:

```python
#!/usr/bin/env python3
print("run")
```

When registered and triggered with TAB, your shell should run the script, read its stdout, and use the output as the completion:

```bash
$ complete -C /path/to/completer_script docker
$ docker <TAB>
$ docker run 
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will create a completer script that always prints a single word to stdout, register it for a command, and then press TAB:

```bash
$ complete -C /path/to/completer_script <command>
$ <command> <TAB>
$ <command> <candidate> 
```

The tester will verify that:

- Your shell runs the registered completer script on TAB
- The single line from stdout is used as the completion
- A trailing space is added after the completed word

### Notes

- You don't need to pass completion context (like the current word being typed) to the completer yet. That comes in later stages.
- Make sure to wait for the completer script to finish before inserting the completion, otherwise you may read partial output.
- The completer script can be written in any language. Your shell just needs to execute it and read from stdout.
