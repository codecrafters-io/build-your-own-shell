In this stage, you'll implement support for appending the standard error of a command to a file.

### The `2>>` Operator

The `2>>` operator is used to append the standard error of a command to a file.

Learn more about [Appending Stderr](https://www.gnu.org/software/bash/manual/bash.html#Appending-Redirected-Output).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of commands to your shell, executing commands, and appending their standard error to a file:

```bash
$ ls nonexistent >> /tmp/foo/baz.md
ls: nonexistent: No such file or directory
$ ls nonexistent 2>> /tmp/foo/qux.md
$ cat /tmp/foo/qux.md
ls: nonexistent: No such file or directory
$ echo "James says Error" 2>> /tmp/foo/quz.md
James says Error
$ cat nonexistent 2>> /tmp/foo/quz.md
$ ls nonexistent 2>> /tmp/foo/quz.md
$ cat /tmp/foo/quz.md
cat: nonexistent: No such file or directory
ls: nonexistent: No such file or directory
```

The tester will check if the commands are executed correctly and append their standard error to a file as specified. The file contents will also be checked for correctness.
