In this stage, you'll add support for recalling history with the down arrow key.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the up and then down arrow keys to recall the history:

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
```

The tester will expect the previous commands to be displayed when the down arrow key is pressed.

### Notes

- We recommend using a library like [readline](https://en.wikipedia.org/wiki/GNU_Readline) for your implementation. Most modern shells and REPLs (like the Python REPL) use readline under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.