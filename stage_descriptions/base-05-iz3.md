In this stage, you'll implement the [echo](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/echo.html) builtin.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `echo` commands to your shell:

```bash
$ echo hello world
hello world
$ echo pineapple strawberry
pineapple strawberry
$
```

After each command, the tester will check if the `echo` command correctly prints the provided text back.