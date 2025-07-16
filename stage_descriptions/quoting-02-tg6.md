In this stage, you'll implement support for quoting with double quotes.

Most characters within double quotes are treated literally, with a few exceptions that will be covered in later stages. Read more about quoting with double quotes [here](https://www.gnu.org/software/bash/manual/bash.html#Double-Quotes).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `echo` commands to your shell:

```bash
$ echo "quz  hello"  "bar"
quz  hello bar
$ echo "bar"  "shell's"  "foo"
bar shell's foo
$
```

The tester will check if the `echo` command correctly prints the quoted text.

Then it will also send a `cat` command, with the file name parameter enclosed in double quotes:

```bash
$ cat "/tmp/file name" "/tmp/'file name' with spaces"
content1 content2
```

The tester will check if the `cat` command correctly prints the file content.