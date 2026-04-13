In this stage, you'll implement the `export` builtin.

### The `export` builtin

In POSIX-like shells, `export` marks variables for the environment. For a simple assignment form such as `export foo=bar`, the shell gives the same result as `declare -x foo=bar`.

```bash
$ export variable=value
$ declare -p variable
declare -x variable="value"
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will verify that `export` is registered as a builtin:

```bash
$ type export
export is a shell builtin
```

It will then assign with `export` and confirm the same description as `declare -x`:

```bash
$ export foo=bar
$ declare -p foo
declare -x foo="bar"
```

The tester will check that `baz` appears in the shell's environment variable list, and that `foo` doesn't.

It will also check that only the exported variable is passed to the child process.

```bash
$ environment_variable_printer_3452 foo baz
The variable "foo" is not set
The value of "baz" is "caz"
```