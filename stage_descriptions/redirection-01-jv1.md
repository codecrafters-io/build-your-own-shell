In this stage, you'll implement support for redirecting the output of a command to a file.

The `1>` operator is used to redirect the output of a command to a file.
But, as a special case, if the file descriptor is not specified before the operator `>`, the output is redirected to the standard output by default, so `>` is equivalent to `1>`.

Learn more about [Redirecting Output](https://www.gnu.org/software/bash/manual/bash.html#Redirecting-Output).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of commands to your shell, executing commands and redirecting their output to a file:

```bash
$ ls /tmp/baz > /tmp/foo/baz.md
$ cat /tmp/foo/baz.md
apple
blueberry
$ echo 'Hello James' 1> /tmp/foo/foo.md
$ cat /tmp/foo/foo.md
Hello James
$ cat /tmp/baz/blueberry nonexistent 1> /tmp/foo/quz.md
cat: nonexistent: No such file or directory
$ cat /tmp/foo/quz.md
blueberry
```

The tester will check if the commands correctly execute commands and redirect their output to a file as specified.
The file contents will also be checked for correctness.