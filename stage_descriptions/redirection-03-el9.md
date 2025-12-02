In this stage, you'll implement support for appending the output of a command to a file.

### The `1>>` Operator

The `1>>` operator is used to append the output of a command to a file.
As a special case, if the file descriptor is not specified before the operator `>>`, the output is redirected to the standard output by default, so `>>` is equivalent to `1>>`.

Learn more about [Appending Stdout](https://www.gnu.org/software/bash/manual/bash.html#Appending-Redirected-Output).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of commands to your shell, executing commands, and appending their output to a file:

```bash
$ ls /tmp/baz >> /tmp/bar/bar.md
$ cat /tmp/bar/bar.md
apple
banana
blueberry
$ echo 'Hello Emily' 1>> /tmp/bar/baz.md
$ echo 'Hello Maria' 1>> /tmp/bar/baz.md
$ cat /tmp/bar/baz.md
Hello Emily
Hello Maria
$ echo "List of files: " > /tmp/bar/qux.md
$ ls /tmp/baz >> /tmp/bar/qux.md
$ cat /tmp/bar/qux.md
List of files:
apple
banana
blueberry
```

The tester will check if the commands are executed correctly and append their output to a file as specified.
The file contents will also be checked for correctness.
