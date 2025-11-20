In this stage, you'll implement support for backslashes outside quotes.

### Backslash Escaping

When a backslash (`\`) is used outside of quotes, it acts as an escape character. If the backslash precedes a character that usually has a special meaning to the shell (like `$`, `*`, `?`, or other delimiters), the backslash causes the character to be treated as a literal character.

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

It will then send a series of `echo` commands to your shell:

```bash
$ echo \'\"hello world\"\'
'"hello world"'
$ echo world\ \ \ \ \ \ script
world      script
$
```

The tester will check if the `echo` command correctly prints the quoted text.

Next, the tester will send a `cat` command, with the file name parameters consisting of backslashes outside quotes:

```bash
$ cat "/tmp/file\\name" "/tmp/file\ name"
content1 content2
```

The tester will verify that the `cat` command correctly prints the file's contents.
