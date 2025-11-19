In this stage, you'll implement support for backslashes outside quotes.

### Backslash Escaping

When a backslash (`\`) is used outside of quotes, it acts as an `escape character`. If the backslash precedes a character that usually has a special meaning to the shell (like `$`, `*`, `?`, or other delimiters), the backslash causes the character to be treated as a literal character.

Most importantly for this stage, a backslash can be used to prevent whitespace from acting as a delimiter. If you use a backslash before a space, that space is preserved as part of the current argument, rather than separating it from the next token.

Here are a few examples illustrating how backslashes behave outside quotes:

| Command | Expected Output | Explanation |
|---------|----------------|-------------|
| `echo world\ \ \ \ \ \ script` | `world      script` | Each `\ ` creates a literal space as part of one argument. |
| `echo before\     after` | `before  after` | The backslash preserves the first space literally, but the shell collapses the subsequent unescaped spaces. |
| `echo hello\\world` | `hello\world` | The first backslash escapes the second, and the result is a single literal backslash in the argument. |

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

The tester will check whether the `cat` command correctly prints the file's contents.
