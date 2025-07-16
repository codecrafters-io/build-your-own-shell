In this stage, you'll implement support for executing a quoted executable.

The tester will rename the `cat` executable to something containing spaces, quotes and backslashes.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of commands to your shell, executing the renamed `cat` executable:

```bash
$ 'exe with "quotes"' file
content1
$ "exe with 'single quotes'" file
content2
```

The tester will check if the commands correctly execute the renamed `cat` executable, and that the output is correct.