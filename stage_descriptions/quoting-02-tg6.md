In this stage, you'll implement support for quoting with double quotes.

### Double Quotes

In shell syntax, most characters within [double quotes](https://www.gnu.org/software/bash/manual/bash.html#Double-Quotes) (`"`) are treated literally. However, double quotes allow certain special characters to be interpreted (like `$` for variables and `\` for escaping), but we'll cover those exceptions in later stages.

For this stage, your shell must apply the following rules when parsing double quotes:

- Consecutive whitespaces (spaces, tabs) must be preserved.
- Characters that normally act as delimiters or special characters lose their special meaning inside double quotes and are treated literally.
- Double-quoted strings placed next to each other are concatenated to form a single argument.

For example:

```bash
$ echo "hello    world"
hello    world          # Multiple spaces preserved

$ echo "hello" "world"
hello world            # Separate arguments

$ echo "shell's test"
shell's test           # Single quotes inside are literal
```


### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of `echo` commands to your shell:

```bash
$ echo "quz  hello"  "bar"
quz  hello bar
$ echo "bar"  "shell's"  "foo"
bar shell's foo
$
```

The tester will check if the `echo` command correctly prints the quoted text.

Next, the tester will send a `cat` command, with the file name parameter enclosed in double quotes:

```bash
$ cat "/tmp/file name" "/tmp/'file name' with spaces"
content1 content2
```

The tester will check if the `cat` command correctly prints the file content.
