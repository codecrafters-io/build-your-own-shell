In this stage, you'll extend the `type` builtin to search for executable files using PATH.

### The PATH Environment Variable

The [PATH](https://en.wikipedia.org/wiki/PATH_(variable)) environment variable specifies a list of directories where the shell should look for executable programs.

For example, if the PATH is set to `/dir1:/dir2:/dir3`, the shell would search for executables in `/dir1`, then `/dir2`, and finally `/dir3`, in that order.

### Searching for Executables

When `type` receives a command input, your shell must follow these steps:
1. Check if the command is a builtin command (like `exit` or `echo`). If it is, report it as a builtin (`<command> is a shell builtin`) and stop.
2. If the command is not a builtin, your shell must go through every directory in PATH. For each directory:
    1. Check if a file with the command name exists.
    2. Check if the file has **execute permissions**.
    3. If the file exists and has execute permissions, print `<command> is <full_path>` and stop.
    4. If the file exists but **lacks execute permissions**, skip it and continue to the next directory.
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

The tester will verify that the `type` command correctly identifies executable files in the PATH:
- Executable files in PATH are reported with their full path (`<command> is <full_path>`).
- Files without execute permissions are skipped.
- Non-existent commands print the `<command>: not found` message.

### Notes

- Most languages provide functions to check execute permissions for a file (like `os.access(path, os.X_OK)` in Python, or `Files.isExecutable()` in Java).
- PATH can include directories that don’t exist on disk, so your code should handle such cases gracefully.
- When parsing the PATH environment variable, remember that the delimiter (usually `:` or `;`) can vary by operating system. Use OS-agnostic path handling provided by your language (like `os.pathsep` in Python, `File.pathSeparator` in Java, or `path.delimiter` in Node.js) to correctly split the directories.
- In Node.js, `fs.accessSync(path, fs.constants.X_OK)` throws an error if the file doesn't exist or isn't executable (it doesn't return a boolean), so it should be used with `try/catch`.

