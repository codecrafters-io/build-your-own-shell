Executable names can contain spaces and literal quote characters too. In this stage, you'll apply the quoting and escaping rules to the command name.

### Quoted executable names

The first word identifies the executable. Parse that word using the same rules as the following arguments, then use the resulting name for PATH lookup. Remove the grouping quotes while preserving any quote characters that the parsing rules make literal.

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
- Upon finding the executable, your shell must spawn the process and pass any other tokens as arguments.

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
- Quoted executable names are correctly processed, with grouping quotes removed and literal characters preserved.
- The resulting executable name is found and executed.
- The output matches what the executable produces.
