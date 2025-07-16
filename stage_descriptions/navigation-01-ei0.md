In this stage, you'll implement the `pwd` builtin command.

[pwd](https://en.wikipedia.org/wiki/Pwd) stands for "print working directory".

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a `pwd` command to your shell:

```bash
$ pwd
/path/to/current/directory
$
```

The tester will check if the `pwd` command correctly prints the current working directory.

### Notes

- The `pwd` command must print the full absolute path of the current working directory.