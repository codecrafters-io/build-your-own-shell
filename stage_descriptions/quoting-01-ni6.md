In this stage, you'll implement support for quoting with single quotes. 

### Single Quotes

[Single quotes](https://www.gnu.org/software/bash/manual/bash.html#Single-Quotes) (`'`) disable all special meaning for characters enclosed within them. Every character between single quotes is treated literally.

When your shell parses a command line:

- Characters inside single quotes (including escape characters and potential special characters like `$`, `*`, or `~`) lose their special meaning and are treated as normal characters.
- Consecutive whitespace characters (spaces, tabs) inside single quotes are preserved and are not collapsed or used as delimiters.
- Quoted strings placed next to each other are concatenated to form a single argument.

Here are a few examples illustrating how single quotes behave:

| Command | Expected output | Explanation |
| :---: | :-------------: | :---------: |
| <code style="white-space: pre;">echo 'hello    world'</code> | <code style="white-space: pre;">hello    world</code> | Spaces are preserved within quotes. |
| <code style="white-space: pre;">echo hello    world</code> | `hello world` | Consecutive spaces are collapsed unless quoted. |
| `echo 'hello''world'` | `helloworld` | Adjacent quoted strings `'hello'` and `'world'` are concatenated.
| `echo hello''world` | `helloworld` | Empty quotes `''` are ignored.


### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of `echo` commands to your shell:

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

### Notes

- The `cat` command is an executable available on most systems, so there's no need to implement it yourself.
