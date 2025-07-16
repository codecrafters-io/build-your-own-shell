In this stage, you'll extend your `cd` builtin command to handle the `~` character.

As a recap, `cd` can receive multiple argument types:

- Absolute paths, like `/usr/local/bin`. (Previous stages)
- Relative paths, like `./`, `../`, `./dir`. (Previous stages)
- The `~` character, which stands for the user's home directory (**This stage**)

The `~` character is shorthand for the user's home directory. When `cd` is received with `~`, your shell should
change the current working directory to the user's home directory. The home directory is specified by the
[`HOME`](https://unix.stackexchange.com/questions/123858/is-the-home-environment-variable-always-set-on-a-linux-system)
environment variable.

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
$ cd ~
$ pwd
/home/user
$
```

The tester will check if the `cd` command correctly changes the directory to the user's home directory when `~` is used.

### Notes

- The `pwd` command will be used to verify the current working directory after using `cd ~`.
- The home directory is specified by the `HOME` environment variable.