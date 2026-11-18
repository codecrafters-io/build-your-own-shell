Your shell needs to report when a requested variable has no stored value. In this stage, you'll implement the missing-name response for `declare -p NAME`.

### The `-p` flag

`declare -p NAME` prints a description of the variable `NAME`. If no such variable exists in the shell's variable store, the shell prints an error.

```bash
$ declare -p variable
declare: variable: not found
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then run `declare -p` with a variable name that has not been defined.

```bash
$ declare -p missing_variable
declare: missing_variable: not found
```

### Notes

- Variable storage comes in later stages. For now, report every queried name as missing, using the name from the input in the error message.
