In this stage, you'll implement the `pwd` builtin.

### The `pwd` Builtin

The [`pwd`](https://en.wikipedia.org/wiki/Pwd) builtin prints the current working directory. `pwd` stands for "print working directory."

Every process (including your shell) has a current working directory, which is the directory it's "in" at any given moment. The `pwd` command displays the full absolute path of this directory.

For example:
```bash
$ pwd
/home/user/projects
$ pwd
/usr/local/bin
```


### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a `pwd` command to your shell:

```bash
$ pwd
/path/to/current/directory
$
```

The tester will verify that the `pwd` command correctly displays the current working directory.

### Notes

- The `pwd` command must print the full absolute path of the current working directory.
- You'll need to use your language's API to get the current working directory (like `process.cwd()` in Node.js, `os.getcwd()` in Python, or `getcwd()` in C).
