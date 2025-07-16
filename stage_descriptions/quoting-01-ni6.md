In this stage, you'll implement support for quoting with single quotes.

Every character within single quotes is interpreted literally, with no special treatment. Read more about quoting with single quotes [here](https://www.gnu.org/software/bash/manual/bash.html#Single-Quotes).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `echo` commands to your shell:

```bash
$ echo 'shell hello'
shell hello
$ echo 'world     test'
world     test
$
```

The tester will check if the `echo` command correctly prints the quoted text.

Then it will also send a `cat` command, with the file name parameter enclosed in single quotes:

```bash
$ cat '/tmp/file name' '/tmp/file name with spaces'
content1 content2
```

The tester will check if the `cat` command correctly prints the file content.

Here are a few examples illustrating how quotes behave:

| Command | Expected output | Explanation |
| :---: | :-------------: | :---------: |
| <code style="white-space: pre;">echo 'hello    world'</code> | <code style="white-space: pre;">hello    world</code> | Spaces are preserved within quotes. |
| <code style="white-space: pre;">echo hello    world</code> | `hello world` | Consecutive spaces are collapsed unless quoted. |
| `echo 'hello''world'` | `helloworld` | Adjacent quoted strings `'hello'` and `'world'` are concatenated.
| `echo hello''world` | `helloworld` | Empty quotes `''` are ignored.

### Notes

- The `cat` command is an executable available on most systems, so there's no need to implement it yourself.