Single-quoted text must remain literal even after your shell learns to handle escapes elsewhere. In this stage, you'll preserve backslashes inside single quotes.

### Backslashes in single quotes

Backslashes have no special escaping behavior inside [single quotes](https://www.gnu.org/software/bash/manual/bash.html#Single-Quotes). Every character (including backslashes) within single quotes is treated literally. 

For example:

```bash
$ echo 'shell\\\nscript'
shell\\\nscript

$ echo 'example\"test'
example\"test
```

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of `echo` commands to your shell:

```bash
$ echo 'multiple\\slashes'
multiple\\slashes
$ echo 'every\"thing_is\"literal'
every\"thing_is\"literal
```

The tester will check if the `echo` command correctly prints the quoted text.


Next, the tester will send a `cat` command, with the file name parameters consisting of backslashes inside single quotes:
```bash
$ cat /tmp/'no slash 1' /tmp/'one slash \2' /tmp/'two slashes \3\'
content1 content2 content3
```

The tester will check whether the `cat` command correctly prints the file's contents.
