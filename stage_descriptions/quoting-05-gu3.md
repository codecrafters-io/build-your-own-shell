In this stage, you'll implement support for quoting with backslashes within double quotes.

Within double quotes `"`, a backslash escapes the following characters: `"`, `\`, `$`, `` ` ``, or newline. Read more about quoting with backslashes within double quotes [here](https://www.gnu.org/software/bash/manual/bash.html#Double-Quotes).

In this stage, we’ll cover:

- `\"` → escapes double quote, allowing " to appear literally within the quoted string
- `\\` → escapes backslash, resulting in a literal \

We won’t cover the following cases in this stage:

- `\$` → escapes the dollar sign, preventing variable expansion
-  `` \` `` → escapes the backtick, preventing command substitution
- `\<newline>` → escapes a newline character, allowing line continuation

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `echo` commands to your shell:

```bash
$ echo "hello'script'\\n'world"
hello'script'\n'world
$ echo "hello\"insidequotes"script\"
hello"insidequotesscript"
$
```

The tester will check if the `echo` command correctly prints the quoted text.

Then it will also send a `cat` command, with the file name parameters consisting of backslashes inside double quotes:

```bash
$ cat "/tmp/"file\name"" "/tmp/"file name""
content1 content2
```

The tester will check if the `cat` command correctly prints the file content.

Here are a few examples illustrating how backslashes behave within double quotes:

| Command | Expected output |
| :---: | :-------------: | 
| `echo "A \\ escapes itself"` | `A \ escapes itself` | 
| `echo "A \" inside double quotes"` | `A " inside double quotes` |