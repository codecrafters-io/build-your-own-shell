In this stage, you'll add support for recalling history with the up arrow key.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the up arrow to recall the history:

```bash
$ echo hello
hello
$ echo world
world
<UP ARROW>
$ echo world
<UP ARROW>
$ echo hello
```

The tester will expect the previous commands to be displayed when the up arrow key is pressed.

### Notes

- We recommend using a library like [readline](https://en.wikipedia.org/wiki/GNU_Readline) for your implementation. Most modern shells and REPLs (like the Python REPL) use readline under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.