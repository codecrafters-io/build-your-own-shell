[Quoting](https://app.codecrafters.io/concepts/shell-quoting) lets a user pass spaces and special characters inside one argument. In this stage, you'll add single-quote support to your argument parsing.

### Single quotes

[Single quotes](https://www.gnu.org/software/bash/manual/bash.html#Single-Quotes) (`'`) disable all special meaning for characters enclosed within them. Every character between single quotes is treated literally.

The surrounding quotes group the text and are removed from the resulting argument. Unquoted spaces separate arguments. Quoted and unquoted segments with no space between them form one argument.

When your shell parses a command line:

- Characters inside single quotes (including escape characters and potential special characters like `$`, `*`, or `~`) lose their special meaning and are treated as normal characters.
- Consecutive whitespace characters (spaces, tabs) inside single quotes are preserved and are not collapsed or used as delimiters.
- Quoted strings placed next to each other are concatenated to form a single argument.

Here are a few examples illustrating how single quotes behave:

| Command | Expected output | Explanation |
| :---: | :-------------: | :---------: |
| <code style="white-space: pre;">echo 'hello    world'</code> | <code style="white-space: pre;">hello    world</code> | Spaces are preserved within quotes. |
| <code style="white-space: pre;">echo hello    world</code> | `hello world` | Unquoted spaces separate two arguments, which `echo` prints with one space between them. |
| `echo 'hello''world'` | `helloworld` | Adjacent quoted strings `'hello'` and `'world'` are concatenated.
| `echo hello''world` | `helloworld` | The empty quoted segment adds no characters to this argument. |

An empty quoted segment inside a word contributes no text, as in `hello''world`. On its own, `''` represents an empty argument. Quoting preserves argument boundaries as well as the characters inside them.


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
