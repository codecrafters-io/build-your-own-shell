In this stage, you'll extend the `type` builtin to search for executable files using PATH.

### The PATH Environment Variable

[PATH](https://en.wikipedia.org/wiki/PATH_(variable)) is an environment variable that specifies a set of directories where executable programs are located. 

For example, if the PATH is set to `/dir1:/dir2:/dir3`, the shell would search for executables in `/dir1`, then `/dir2`, and finally `/dir3`, in that order.

### Searching for Executables

When `type` receives a command input, your shell must follow these steps:
1. Check if the command is a builtin command (like `exit` or `echo`). If it is, report it as a builtin (`<command> is a shell builtin`) and stop.
2. If the command is not a builtin, your shell must go through every directory in PATH. For each directory:
    1. Check if a file with the command name exists.
    2. If the file exists and has execute permissions, print `<command> is <full_path>` and stop searching.
    3. If the file exists but doesn't have execute permissions, skip it and continue to the next directory.
3. If no executable is found in any directory, print `<command>: not found`.

For example:

```bash
$ type grep
grep is /usr/bin/grep
$ type invalid_command
invalid_command: not found
$ type echo
echo is a shell builtin
```

### Tests

The tester will execute your program with a custom `PATH` like this:

```bash
PATH="/usr/bin:/usr/local/bin:$PATH" ./your_program.sh
```

It will then send a series of `type` commands to your shell:

```bash
$ type ls
ls is /usr/bin/ls
$ type valid_command
valid_command is /usr/local/bin/valid_command
$ type invalid_command
invalid_command: not found
$
```

The tester will check if the `type` command correctly identifies executable files in the PATH.

### Notes

- The actual value of the `PATH` environment variable will be random for each test case.
- PATH can include directories that don’t exist on disk, so your code should handle such cases gracefully.
