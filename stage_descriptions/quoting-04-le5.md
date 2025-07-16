In this stage, you'll implement support for quoting with backslashes within single quotes.

Within single quotes `'`, every character (including backslashes) is treated literally. No escaping is performed. Read more about quoting with backslashes within single quotes [here](https://www.gnu.org/software/bash/manual/bash.html#Single-Quotes).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `echo` commands to your shell:

```bash
$ echo 'shell\\\nscript'
shell\\\nscript
$ echo 'example\"testhello\"shell'
example\"testhello\"shell
$
```

The tester will check if the `echo` command correctly prints the quoted text.


Then it will also send a `cat` command, with the file name parameters consisting of backslashes inside single quotes:
```bash
$ cat "/tmp/file/'name'" "/tmp/file/'\name\'"
content1 content2
```

The tester will check if the `cat` command correctly prints the file content.