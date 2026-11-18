Error messages can accumulate in a file just as ordinary output can. In this stage, you'll add `2>>` to append standard error.

### The `2>>` operator

The `2>>` operator appends the standard error of a command to a file. Unlike `2>`, which overwrites the file, `2>>` adds error messages to the end of the file and preserves any existing content.

If the file doesn't exist, it is created. Standard output keeps its existing destination.

For example: 

```bash
$ cat nonexistent1 2>> errors.txt
$ cat nonexistent2 2>> errors.txt
$ cat errors.txt
cat: nonexistent1: No such file or directory
cat: nonexistent2: No such file or directory
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then send a series of commands to your shell and append their standard error to a file:

```bash
$ ls nonexistent >> /tmp/foo/baz.md
ls: nonexistent: No such file or directory

$ ls nonexistent 2>> /tmp/foo/qux.md
$ cat /tmp/foo/qux.md
ls: nonexistent: No such file or directory

$ echo James says Error 2>> /tmp/foo/quz.md
James says Error

$ cat nonexistent 2>> /tmp/foo/quz.md
$ ls nonexistent 2>> /tmp/foo/quz.md
$ cat /tmp/foo/quz.md
cat: nonexistent: No such file or directory
ls: nonexistent: No such file or directory
```

The tester will verify that:
- Commands with `2>>` append their standard error to the specified file.
- Existing file content is preserved (not overwritten).
- Standard output still appears on the terminal (not redirected).
- Files are created if they don't exist.
