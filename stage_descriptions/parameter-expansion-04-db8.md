In this stage, you'll add support for validation for shell variable names.

### Validating identifiers

A shell variable name must be a valid identifier: it starts with a letter or an underscore, and the rest of the name may use letters, digits, and underscores.

A digit must not be the first character. If the name is invalid, the shell reports an error and does not create a variable.

For example:

```bash
# Valid variable declaration
$ declare foo=bar
$ 

# Valid variable declaration
$ declare _FOO=BAR
$ 

# Invalid variable
$ declare 67=x
declare: `67=x': not a valid identifier
$ 
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will send `declare` with valid names (starting with a letter or `_`) and with invalid names (for example one that starts with a digit). For an invalid name, the tester will verify output like:

```bash
$ declare 23=x
declare: `23=x': not a valid identifier
$ declare _FOO=bar
$ declare -p _FOO
declare -- _FOO="bar"
```