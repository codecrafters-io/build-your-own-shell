In this stage, you'll extend your `cd` builtin to handle relative paths.

### The `cd` Builtin (Recap)

As a recap, `cd` can receive multiple argument types:

- Absolute paths, like `/usr/local/bin`. (Handled in previous stages)
- Relative paths, like `./`, `../`, `./dir`. 
- The `~` character.

For this stage, you'll handle the second argument type.

### Relative Paths

A relative path specifies a location relative to the current working directory, rather than from the root of the filesystem.

Your shell must correctly interpret and navigate the following components of a relative path:

- `./` (Current Directory): Refers to the current working directory itself.
- `../` (Parent Directory): Refers to the directory immediately above the current working directory in the file system hierarchy. 
- Subdirectories: Paths like `./dirname` or `dirname` are treated as relative to the current directory.

Here are some examples:
```bash
$ pwd
/usr
$ cd ./local/bin    # Go to "local/bin" inside current directory (/usr)
$ pwd
/usr/local/bin
$ cd ../../         # Go up two levels
$ pwd
/usr
$ cd local          # "local" is shorthand for "./local"
$ pwd
/usr/local
```

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send a series of `cd` commands to your shell:

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

The tester will verify that:
- Valid relative paths change the directory correctly. 
- Invalid relative paths print the error message `cd: <directory>: No such file or directory`.
- The directory remains unchanged when `cd` fails.

### Notes

- The actual directory names used will be random, so you can't hardcode the expected output.
