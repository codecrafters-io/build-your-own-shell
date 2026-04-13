In this stage, you'll add support for passing the exported variables to the child process.

### Environment and child processes

When the shell runs an external program, it builds an environment for that child process. Variables created with `declare -x` appear in that environment. Variables that are declared without `-x` attribute stay in the shell’s internal variable store and are not copied into the child’s environment.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will define an exported variable. It will then run a helper program in a child process and verify that the exported name is visible in that process’s environment and that the non-exported name is not.

```bash
$ declare foo=bar
$ declare -x baz=caz
```

The tester will check that `baz` appears in the shell's environment variable list, and that `foo` doesn't.

It will also check that only the exported variable is passed to the child process.

```bash
$ environment_variable_printer_3452 foo baz
The variable "foo" is not set
The value of "baz" is "caz"
```

### Notes

- You can use `[setenv]`(https://man7.org/linux/man-pages/man3/setenv.3.html) or the equivalent in your language when building the environment for `exec`-style calls.
