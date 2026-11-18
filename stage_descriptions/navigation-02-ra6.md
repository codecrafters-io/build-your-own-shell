Your shell can show its current directory with `pwd`. In this stage, you'll implement `cd` with absolute paths to change that directory for subsequent commands.

### The `cd` builtin

The `cd` (change directory) builtin changes the shell process's current working directory. A child process has its own working directory, so changing a separate program's directory would leave the shell unchanged.

The `cd` command can handle different types of arguments:

- Absolute paths, like `/usr/local/bin`. 
- Relative paths, like `./`, `../`, `./dir`. 
- The `~` character, which represents the user's home directory.

For this stage, we'll focus on absolute paths.

### Handling absolute paths

An absolute path starts with `/` and specifies a location from the root of the filesystem.

When `cd` receives an absolute path:
- If the directory exists, change to that directory.
- If the directory doesn't exist, print `cd: <directory>: No such file or directory`.

For example:
```bash
$ pwd
/home/user
$ cd /usr/local/bin
$ pwd
/usr/local/bin
$ cd /does_not_exist
cd: /does_not_exist: No such file or directory
$ pwd
/usr/local/bin
```

If the directory change fails, the current directory should remain unchanged.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of `cd` commands to your shell:

```bash
$ cd /usr/local/bin
$ pwd
/usr/local/bin
$ cd /does_not_exist
cd: /does_not_exist: No such file or directory
$
```

The tester will verify that:
- Valid paths change the directory.
- Invalid paths print the error message `cd: <directory>: No such file or directory`.
- Invalid paths don't change the current directory.

### Notes

- Check if the directory exists before attempting to change to it, or handle the error if the change fails.
