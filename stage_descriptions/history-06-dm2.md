A recalled command is still pending input until the user submits it. In this stage, you'll execute that command when Enter is pressed.

### Submitting recalled input

Execute the command again so it produces fresh output. History stores the command text rather than a saved copy of its earlier output.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will send commands, navigate through history with Up and Down, and press Enter on the selected command:

```bash
$ echo hello
hello
$ echo world
world
<UP ARROW>
$ echo world
<UP ARROW>
$ echo hello
<DOWN ARROW>
$ echo world
<ENTER>
world
$
```

The tester will expect the command to be executed when the enter key is pressed.
