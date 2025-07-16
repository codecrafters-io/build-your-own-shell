In this stage, you'll implement support for redirecting the standard error of a command to a file.

The `2>` operator is used to redirect the standard error of a command to a file.

Learn more about [Redirecting Stderr](https://www.gnu.org/software/bash/manual/bash.html#Redirecting-Output).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of commands to your shell, executing commands and redirecting their output to a file:

```bash
$ ls nonexistent 2> /tmp/quz/baz.md
$ cat /tmp/quz/baz.md
ls: nonexistent: No such file or directory
$ echo 'Maria file cannot be found' 2> /tmp/quz/foo.md
Maria file cannot be found
$ cat /tmp/bar/pear nonexistent 2> /tmp/quz/quz.md
pear
$ cat /tmp/quz/quz.md
cat: nonexistent: No such file or directory
```

The tester will check if the commands correctly execute commands and redirect their error message to a file as specified.

It will also check that the file is created (if it doesn’t already exist), and that its contents match the expected output.