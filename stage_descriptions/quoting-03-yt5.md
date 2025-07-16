In this stage, you'll implement support for quoting with backslashes.

A non-quoted backslash `\` is treated as an escape character. It preserves the literal value of the next character. Read more about quoting with backslashes [here](https://www.gnu.org/software/bash/manual/bash.html#Escape-Character).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `echo` commands to your shell:

```bash
$ echo "before\   after"
before\   after
$ echo world\ \ \ \ \ \ script
world      script
$
```

The tester will check if the `echo` command correctly prints the quoted text.

Then it will also send a `cat` command, with the file name parameters consisting of backslashes inside quotes:

```bash
$ cat "/tmp/file\\name" "/tmp/file\ name"
content1 content2
```

The tester will check if the `cat` command correctly prints the file content.