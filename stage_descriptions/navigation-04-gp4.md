The user's home directory is a destination supplied by the shell's environment. In this stage, you'll extend `cd` to accept `~` as that directory.

### The `~` character

The `~` (tilde) character is shorthand for the user's home directory. It's a convenient way to quickly navigate back to your home directory from anywhere in the filesystem.

The [`HOME`](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap08.html#tag_08_03) environment variable specifies the home directory. `cd ~` must change to that value, regardless of the current directory. The path varies between environments, so it cannot be hardcoded.

For example:
```bash
$ pwd
/usr/local/bin
$ cd ~
$ pwd
/home/user
$ cd /var/log
$ pwd
/var/log
$ cd ~
$ pwd
/home/user
```   

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
$ cd ~
$ pwd
/home/user
$
```

The tester will verify that:
- `cd ~` changes to the home directory.
- The home directory matches the value of the `HOME` environment variable.

### Notes

- Most languages provide functions to read environment variables (like `process.env.HOME` in Node.js, `os.getenv('HOME')` in Python, or `getenv("HOME")` in C).
