In this stage, you'll extend the `type` builtin to search for executable files using PATH.

### The PATH Environment Variable

[PATH](https://en.wikipedia.org/wiki/PATH_(variable)) is an environment variable that specifies a set of directories where executable programs are located. 

For example, if PATH is `/dir1:/dir2:/dir3`, the shell would search in `/dir1`, then `/dir2`, and finally `/dir3`, in that order.

### Searching for Executables

When `type` receives a command, your shell should go through every directory in PATH. For each directory:

- Check if a file with the command name exists
- If the file exists and has execute permissions, print `<command> is <full_path>` and stop searching
- If the file exists but doesn't have execute permissions, skip it and continue to the next directory

If no executable is found in any directory, print `<command>: not found`

For example:

```bash
$ type ls
ls is /usr/bin/ls
$ type grep
grep is /usr/bin/grep
$ type invalid_command
invalid_command: not found
```

If a command exists as both a builtin and an executable file, the builtin takes priority:

```bash
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
