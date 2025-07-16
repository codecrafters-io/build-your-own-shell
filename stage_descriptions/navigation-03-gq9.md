In this stage, you'll extend your `cd` builtin command to handle relative paths.

As a recap, `cd` can receive multiple argument types:

- Absolute paths, like `/usr/local/bin`. (Previous stages)
- Relative paths, like `./`, `../`, `./dir`. (**This stage**)
- The `~` character, which stands for the user's home directory (Later stages)

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `cd` commands to your shell:

```bash
$ cd /usr
$ pwd
/usr
$ cd ./local/bin
$ pwd
/usr/local/bin
$ cd ../../
$ pwd
/usr
$
```

The tester will check if the `cd` command correctly changes the directory when a valid path is provided. It'll
also check whether the message `cd: <directory>: No such file or directory` is printed if the provided path is invalid.

### Notes

- The actual directory names used will be random, so you can't hardcode the expected output.
- Relative paths like `./`, `../`, and more complex relative paths should be handled correctly.
- The `cd` command doesn't print anything if the directory is changed successfully. The tester will use `pwd` to verify
  the current working directory after using `cd`.