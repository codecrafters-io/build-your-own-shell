In this stage, you'll add support for parameter expansion using the `$VAR` form.

### Expansion

When a command line contains `$NAME` and `NAME` is set in the shell (including exported variables), the shell replaces that token with the variable’s value before invoking builtins or external programs.

The substitution happens in the words the shell passes as arguments. It does not change how the variable is stored internally. Each expanded value becomes a separate argument to the program the shell runs.

For example:

```bash
$ export VARIABLE=VALUE
$ FOO=BAR
$ echo $VARIABLE $FOO
VALUE BAR
```

Here `echo` receives two words after expansion (`VALUE` and `BAR`), not the literal strings `$VARIABLE` and `$FOO`.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will set variables, then run a program with arguments that use `$VAR` expansion. For example:

```bash
$ export VARIABLE=VALUE
$ FOO=BAR
$ custom_exe_1234 $VARIABLE $FOO
Program was passed 3 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: VALUE
Arg #2: BAR
Program Signature: 5998595441
```

The output shown above comes from the executable itself. The tester will verify the argument list matches the expanded values.

### Notes

- In this stage, support the simple `$VAR` syntax only. We'll get to supporting the `${VAR}` form in the later stages.  
