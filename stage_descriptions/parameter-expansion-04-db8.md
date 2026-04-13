In this stage, you'll support the `-x` option to `declare`, which marks a variable as exported.

### The `-x` option

The `declare -x` form creates or updates a shell variable and sets its exported attribute: the variable is stored in the shell’s variable set and is included in the environment the shell passes to child processes when it runs an external program. `declare -p` reflects that state by printing `-x` in the line for that variable.

For example:

```bash
$ declare -x foo=bar
$ declare -p foo
declare -x foo="bar"
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then create an exported variable with `declare -x` and verify `declare -p` reports the exported form:

```bash
$ declare -x foo=bar
$ declare baz=caz
$ declare -p foo
declare -x foo="bar"
$ declare -p baz
declare -- baz="caz"
```

### Notes

- For this stage, focus on storing the exported attribute and reflecting it in `declare -p` output. We'll get to passing it to the child process in the later stages.