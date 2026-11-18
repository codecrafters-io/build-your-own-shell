Variable names must follow the rules used to recognize them in commands. In this stage, you'll validate names before accepting a `declare` assignment.

### Validating identifiers

A shell variable name must be a valid identifier: it starts with a letter or an underscore, and the rest of the name may use letters, digits, and underscores.

A digit must not be the first character. If the name is invalid, the shell reports an error and does not create a variable.

The error includes the entire assignment, such as `67=x`, enclosed by an opening backtick and a closing single quote. Preserve those characters exactly as shown below.

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
