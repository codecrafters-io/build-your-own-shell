Directory navigation lets users change where commands operate. In this stage, you'll implement the `pwd` builtin to show the shell's current directory.

### The `pwd` builtin

Each process has a current working directory, the starting point for relative paths such as `file.txt`. The [`pwd`](https://en.wikipedia.org/wiki/Pwd) (print working directory) builtin prints that directory's full, absolute path to stdout. An absolute path starts at the filesystem root, `/`.

When your shell starts, its current working directory is typically the directory from which it was executed. Your `pwd` implementation needs to retrieve this information from the operating system and print it.

These examples show two separate shell sessions started in different directories. Repeating `pwd` within one session does not change the directory:
```bash
$ pwd
/home/user/projects
$ pwd
/usr/local/bin
```

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a `pwd` command to your shell:

```bash
$ pwd
/path/to/current/directory
$
```

The tester will verify that the `pwd` command correctly displays the current working directory.

### Notes

- Implement `pwd` in your shell, even if an external `pwd` executable is available. As with your other builtins, `type pwd` should identify it as a shell builtin.
