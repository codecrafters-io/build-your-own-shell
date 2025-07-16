In this stage, you'll implement support for being able to press enter to execute a command recalled using UP-DOWN arrows.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the up and then down arrow keys to recall the history and then press enter to execute the command:

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