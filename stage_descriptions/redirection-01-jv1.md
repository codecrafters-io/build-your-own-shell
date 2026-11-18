Output redirection lets users save a command's results in a file. In this stage, you'll add standard-output redirection for builtins and external programs.

### The `>` operator

Commands have separate output streams. Standard output (stdout) carries ordinary results, while standard error (stderr) carries errors and diagnostics. Both normally appear in the terminal.

The `>` operator sends stdout to the named file. The shell interprets the operator and destination path, so they aren't passed to the command as arguments. The redirection applies to that command. The next shell prompt still appears in the terminal.

If the file doesn't exist, it is created. If the file already exists, it is overwritten (replacing its old contents).

For example:

```bash
$ echo hello > output.txt
$ cat output.txt
hello
```

### File descriptor notation

In Unix, a file descriptor is a number identifying an open input or output connection for a process. Standard output uses descriptor `1`. You can explicitly write `1>` to redirect it:

```bash
$ echo hello 1> file.txt
```

However, since redirecting standard output is so common, the shell allows you to omit the `1` and just write `>`:

```bash
$ echo hello > file.txt
```

Both commands do exactly the same thing.

### Error output is not redirected

The `>` operator changes the destination of stdout. Standard error keeps its existing destination, so error messages still appear on the terminal:

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

$ echo Hello James 1> /tmp/foo/foo.md
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
