In this stage, you'll implement support for executing a quoted executable.

### Quoted Executable Names

Up until now, the executable name (the first word in a command) has been a simple string. But executable names can also be quoted, just like arguments.

This is useful when an executable has spaces, quotes, or special characters in its name. Quoting the executable name lets you execute programs that would otherwise be difficult to reference.

For example:

```bash
$ 'my program' argument1
# Runs an executable named "my program"

$ "exe with spaces" file.txt
# Runs an executable named "exe with spaces"
```

When your shell receives a command with a quoted executable:

- Your parser must correctly interpret the quotes to form the executable name (e.g., from `"my 'program'"` to `my 'program'`).
- Your shell must search for the unquoted program name in the `PATH` directories.
- Upon finding the executable, your shell must spawn the process, passing any other tokens as arguments.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of commands to your shell, executing the renamed `cat` executable:

```bash
$ 'exe with "quotes"' file
content1
$ "exe with 'single quotes'" file
content2
```

The tester will verify that:
- Quoted executable names are correctly processed (quotes removed).
- The resulting executable name is found and executed.
- The output matches what the executable produces.
