Users may want to save error messages while ordinary output stays in the terminal. In this stage, you'll redirect standard error with `2>`.

### The `2>` operator

The `2>` operator redirects the standard error of a command to a file. The standard error is where programs write error messages and diagnostics.

In Unix, standard error is identified by the number `2`. When you write `2>`, you're explicitly redirecting file descriptor 2 (stderr) to a file.

As with `>`, create the destination if it doesn't exist and replace its old contents if it does. This happens even when the command writes nothing to stderr.

For example:

```bash
$ cat nonexistent 2> errors.txt
$ cat errors.txt
cat: nonexistent: No such file or directory
```

Here, the error message is written to `errors.txt` rather than appearing in the terminal.

### Standard output is not redirected

The `2>` operator changes stderr's destination. Standard output is unchanged and still appears on the terminal:

```bash
$ cat existing_file nonexistent 2> errors.txt
contents of existing file
$ cat errors.txt
cat: nonexistent: No such file or directory

$ echo hello 2> errors.txt
hello
$ cat errors.txt
$
```

In the example above, the file contents appear in the terminal, while any error message goes to `errors.txt`.

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then send a series of commands to your shell and attempt to redirect its standard error to a file:
```bash
$ ls nonexistent 2> /tmp/quz/baz.md
$ cat /tmp/quz/baz.md
ls: nonexistent: No such file or directory

$ echo Maria file cannot be found 2> /tmp/quz/foo.md
Maria file cannot be found
$ 

$ cat /tmp/bar/pear nonexistent 2> /tmp/quz/quz.md
pear
$ cat /tmp/quz/quz.md
cat: nonexistent: No such file or directory
```

The tester will verify that:
- Commands with `2>` redirect their standard error to the specified file.
- The specified files are created if they don't exist.
- Standard output still appears on the terminal (not redirected).
- Standard errors are not displayed on the terminal.
