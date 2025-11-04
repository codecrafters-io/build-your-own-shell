In this stage, you'll implement the `cd` builtin command to handle absolute paths. 

The `cd` command is used to change the current working directory. `cd` can receive multiple
argument types. In this challenge we'll cover:

- Absolute paths, like `/usr/local/bin`. (**This stage**)
- Relative paths, like `./`, `../`, `./dir`. (Later stages)
- The `~` character, which stands for the user's home directory (Later stages)

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a series of `cd` commands to your shell:

```bash
$ cd /usr/local/bin
$ pwd
/usr/local/bin
$ cd /does_not_exist
cd: /does_not_exist: No such file or directory
$
```

The tester will check if the `cd` command correctly changes the directory when a valid path is provided. It'll
also check whether the message `cd: <directory>: No such file or directory` is printed if the provided path is invalid.

### Notes

- The `cd` command doesn't print anything if the directory is changed successfully. The tester will use `pwd` to verify
  the current working directory after using `cd`.
