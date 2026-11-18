A working command can produce ordinary output as well as errors. In this stage, you'll implement the `echo` builtin to print its arguments.

### The `echo` builtin

The words after a command name are its arguments. The [`echo`](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/echo.html) builtin prints those arguments to standard output (stdout), the stream used for ordinary output. Separate the arguments with one space and finish with a newline (`\n`). Quoting and escaping come in later stages.

Example usage:

```bash
$ echo hello world
hello world
$ echo one two three
one two three
```

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of `echo` commands to your shell:

```bash
$ echo hello world
hello world
$ echo pineapple strawberry
pineapple strawberry
$
```

After each command, the tester will verify that the `echo` command correctly prints the provided text back.

### Notes

- Most languages' standard output functions like `console.log()` (JavaScript), `print()` (Python), or `println()` (Java) automatically add a newline, which is what you want here. If your language requires explicit newlines (like C's `printf()`), make sure to add `\n` at the end.
