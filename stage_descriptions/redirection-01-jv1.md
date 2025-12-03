In this stage, you'll implement support for redirecting a command's output to a file.

### The `>` Operator

The `>` operator redirects the standard output of a command to a file. When you use `>`, the output that would normally appear on the terminal is instead written to the specified file.

If the file doesn't exist, it is created. If the file already exists, it is overwritten (replacing its old contents).

For example:

```bash
$ echo hello > output.txt
$ cat output.txt
hello
```

### File Descriptor Notation

In Unix, standard output is identified by the number `1`. You can explicitly write `1>` to redirect standard output:

```bash
$ echo hello 1> file.txt
```

However, since redirecting standard output is so common, the shell allows you to omit the `1` and just write `>`:

```bash
$ echo hello > file.txt
```

Both commands do exactly the same thing. The `>` is shorthand for `1>`.

### Error Output Is Not Redirected

The `>` operator only redirects standard output, not standard error. If a command produces error messages, they still appear on the terminal:

```bash
$ cat nonexistent > output.txt
cat: nonexistent: No such file or directory
$ cat output.txt
$ 
```

The error message appears on the terminal, and `output.txt` is empty (or contains only the non-error output if there was any).

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then send a series of commands to your shell and redirect their output to a file:

```bash
$ ls /tmp/baz > /tmp/foo/baz.md
$ cat /tmp/foo/baz.md
apple
blueberry

$ echo 'Hello James' 1> /tmp/foo/foo.md
$ cat /tmp/foo/foo.md
Hello James

$ cat /tmp/baz/blueberry nonexistent 1> /tmp/foo/quz.md
cat: nonexistent: No such file or directory
$ cat /tmp/foo/quz.md
blueberry
```

The tester will verify that:
- Commands with `>` redirect their standard output to the specified file.
- Commands with `1>` work identically to `>`.
- Files are created if they don't exist.
- Error messages still appear on the terminal (not redirected).
- Only standard output is written to the file.

