A backslash can preserve an individual space or quote without enclosing the whole argument. In this stage, you'll add backslash escaping outside quotes.

### Backslash escaping

When a backslash `\` is used outside of quotes, it acts as an escape character. The backslash removes the special meaning of the next character and treats it as a literal character. After escaping, the backslash itself is removed.

For the single-line commands in this stage, this applies to:
- Characters with special meaning (like space, `'`, `"`, `$`, `*`, `?`, and other delimiters)
- Characters without special meaning (regular letters like `n`, `t`, etc.)

Here are a few examples illustrating how backslashes behave outside quotes:

| Command | Expected output | Explanation |
|---------|----------------|-------------|
| `echo three\ \ \ spaces` | <code style="white-space: pre;">three   spaces</code> | Each <code style="white-space: pre;">\ </code> creates a literal space as part of one argument. |
| <code style="white-space: pre;">echo before\     after</code> | <code style="white-space: pre;">before  after</code> | The first argument ends with a literal space. Unescaped spaces separate the next argument, and `echo` adds one space between them. |
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
$ echo multiple\ \ \ \ spaces
multiple    spaces
$ echo \'\"literal quotes\"\'
'"literal quotes"'
$ echo ignore\_backslash
ignore_backslash
```

The tester will check if the `echo` command correctly handles escaped characters.

Next, the tester will send a `cat` command with backslashes used to escape characters within filename arguments:

```bash
$ cat /tmp/\_ignored_1 /tmp/ignore_\2 /tmp/just_one_\\_3
content1 content2 content3
```

The tester will verify that the `cat` command correctly accesses these files.

### Notes

- Bash treats a backslash followed by a newline as line continuation. That case is outside this stage, which uses single-line commands.
