In this stage, you'll implement the `-p` flag of the declare builtin when the requested variable does not exist.

### The `-p` flag

`declare -p NAME` prints a description of the variable `NAME`. If no such variable exists in the shell’s variable store, the shell prints an error.

```bash
$ declare -p variable
declare: variable: not found
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then run `declare -p` with a variable name has not been defined.

```bash
$ declare -p missing_variable
declare: missing_variable: not found
```

### Notes

- You can hardcode the output of the `declare` builtin for this stage. We'll get to implementing storing shell variables in the later stages.
