In this stage, you'll implement support for backslashes within double quotes.

### Backslashes in Double Quotes

Within [double quotes](https://www.gnu.org/software/bash/manual/bash.html#Double-Quotes), a backslash only escapes certain special characters: `"`, `\`, `$`, `` ` ``, and `newline`. For all other characters, the backslash is treated literally.

In this stage, we’ll cover:

- `\"`: escapes double quote, allowing `"` to appear literally within the quoted string.
- `\\`: escapes backslash, resulting in a literal `\`.

We won’t cover the following cases in this stage:

- `\$`: escapes the dollar sign.
- `` \` ``: escapes the backtick.
- `\<newline>`: escapes a newline character.

Here are a few examples illustrating how backslashes behave within double quotes:

|              Command               |      Expected output       |
| :--------------------------------: | :------------------------: |
|    `echo "A \\ escapes itself"`    |    `A \ escapes itself`    |
| `echo "A \" inside double quotes"` | `A " inside double quotes` |

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
$ cat "/tmp/ant/\"f 38\"" "/tmp/ant/\"f\\93\""
content1 content2
```

The tester will check whether the `cat` command correctly prints the file's contents.


