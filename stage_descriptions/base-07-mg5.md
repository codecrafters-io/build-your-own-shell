A shell can find a program even when the user hasn't supplied its full path. In this stage, you'll extend `type` to locate executable files using PATH.

### The PATH environment variable

An environment variable is a named text value passed to a program when it starts. The [PATH](https://app.codecrafters.io/concepts/what-is-path) environment variable lists the directories to search for executable programs.

For example, if the PATH is set to `/dir1:/dir2:/dir3`, the shell would search for executables in `/dir1`, then `/dir2`, and finally `/dir3`, in that order.

### Searching for executables

An executable file must have execute permission, which allows the operating system to run it as a program. A matching filename alone is insufficient.

Command lookup follows these rules:

- Builtins take priority over files. Report `<command> is a shell builtin` for a builtin such as `exit` or `echo`.
- For other names, the first executable file in PATH order wins. Report `<command> is <full_path>`.
- Skip files that lack execute permission and continue searching later directories.
- If no executable is found, report `<command>: not found`.

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

{{#lang_is_elixir}}
- You can either use [System.find_executable](https://hexdocs.pm/elixir/1.19.5/System.html#find_executable/1) or implement the PATH traversal logic on your own.
{{/lang_is_elixir}}

{{#lang_is_go}}
- You can either use [exec.LookPath](https://pkg.go.dev/os/exec#LookPath) or implement the PATH traversal logic on your own.
{{/lang_is_go}}

{{^lang_is_elixir}}
{{^lang_is_go}}
- Most languages provide functions to check execute permissions for a file (like `os.access(path, os.X_OK)` in Python, or `Files.isExecutable()` in Java).
{{/lang_is_go}}
{{/lang_is_elixir}}

- PATH can include directories that don't exist on disk, so your code should handle such cases gracefully.
- When parsing the PATH environment variable, remember that the delimiter (usually `:` or `;`) can vary by operating system. Use OS-agnostic path handling provided by your language (like `os.pathsep` in Python, `File.pathSeparator` in Java, or `path.delimiter` in Node.js) to correctly split the directories.
