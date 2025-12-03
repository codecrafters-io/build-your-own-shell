In this stage, you'll implement support for redirecting a command's standard error to a file.

### The `2>` Operator

The `2>` operator redirects the standard error of a command to a file. The standard error is where programs write error messages and diagnostics.

In Unix, standard error is identified by the number `2`. When you write `2>`, you're explicitly redirecting file descriptor 2 (stderr) to a file.

For example:

```bash
$ cat nonexistent 2> errors.txt
$ cat errors.txt
cat: nonexistent: No such file or directory
```

Here, the error message is written to `errors.txt` rather than appearing in the terminal.

### Standard Output Is Not Redirected

The `2>` operator only redirects standard error, not standard output. Normal output still appears on the terminal:

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

$ echo 'Maria file cannot be found' 2> /tmp/quz/foo.md
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
