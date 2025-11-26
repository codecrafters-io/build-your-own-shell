In this stage, you'll implement support for backslashes outside quotes.

### Backslash Escaping

When a backslash `\` is used outside of quotes, it acts as an escape character. The backslash removes the special meaning of the next character and treats it as a literal character. After escaping, the backslash itself is removed.

This works for any character, including:
- Characters with special meaning (like space, `'`, `"`, `$`, `*`, `?`, and other delimiters)
- Characters without special meaning (regular letters like `n`, `t`, etc.)

Here are a few examples illustrating how backslashes behave outside quotes:

| Command | Expected Output | Explanation |
|---------|----------------|-------------|
| `echo world\ \ \ \ \ \ script` | <code style="white-space: pre;">world      script</code> | Each `\ ` creates a literal space as part of one argument. |
| `echo before\     after` | <code style="white-space: pre;">before  after</code> | The backslash preserves the first space literally, but the shell collapses the subsequent unescaped spaces. |
| `echo test\nexample` | `testnexample` | `\n` becomes just `n`. |
| `echo hello\\world` | `hello\world` | The first backslash escapes the second, and the result is a single literal backslash in the argument. |
| `echo \'hello\'` | `'hello'` | `\'` makes the single quotes literal characters. |

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then send a series of `echo` commands to your shell:
```bash
$ echo \'\"hello world\"\'
'"hello world"'
$ echo world\ \ \ \ \ \ script
world      script
$
```

The tester will check if the `echo` command correctly handles escaped characters.

Next, the tester will send a `cat` command with backslashes used to escape characters within filename arguments:

```bash
$ cat "/tmp/file\\name" "/tmp/file\ name"
content1 content2
```

The tester will verify that the `cat` command correctly accesses these files.
