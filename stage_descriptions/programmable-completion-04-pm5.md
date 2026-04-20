In this stage, you'll invoke the registered completer script and use its output to complete a single candidate.

### Running the Completer Script

In earlier stages, you registered completer scripts with `complete -C` and stored them. Now you'll actually run them when the user presses TAB.

When the user types a command name followed by a space and presses TAB, your shell should:

1. Look up the registered completer for that command
2. Run the script as a separate process
3. Read its stdout
4. Use each line of output as a completion candidate

For this stage, the completer will always print exactly one line. Your shell should take that line and complete the user's input with it, followed by a trailing space.

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

The completer script can be written in any language. Your shell just needs to execute it and read from stdout.

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
