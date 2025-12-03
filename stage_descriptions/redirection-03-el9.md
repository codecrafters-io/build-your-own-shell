In this stage, you'll implement support for appending the output of a command to a file.

### The `>>` Operator

The `>>` operator appends the standard output of a command to a file. Unlike `>`, which overwrites the file, `>>` adds the output to the end of the file and preserves any existing content.

If the file doesn't exist, it is created (just like `>`). If the file already exists, the new output is added to the end.

For example:
```bash
$ echo first >> output.txt
$ echo second >> output.txt
$ cat output.txt
first
second
```

You can also explicitly write `1>>` to append the command's standard output to a file. Both `>>` and `1>>` do exactly the same thing.

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then send a series of commands to your shell and attempt to append their output to a file:
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

The tester will verify that:
- Commands with `>>` append their standard output to the specified file
- Commands with `1>>` work identically to `>>`.
- Existing file content is preserved (not overwritten).
- Files are created if they don't exist.
