In this stage, you'll add support for parameter expansion using the `$VAR` form.

### Expansion

When a command line contains `$NAME` and `NAME` is a variable, the shell replaces `$NAME` with the variable’s value before invoking builtins or external programs.

The substitution happens in the words the shell passes as arguments. It does not change how the variable is stored internally. Each expanded value becomes a separate argument to the program the shell runs.

For example:

```bash
$ declare Variable_1=value
$ declare Variable_2=value2
$ echo $Variable_1 $Variable_2
value value2
```

Here `echo` receives two words after expansion (`value` and `value2`), not the literal strings `$Variable_1` and `$Variable_2`.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will set variables, then run a program with arguments that use `$VAR` expansion. For example:

```bash
$ declare Variable_1=Value_1
$ declare Variable_2=Value2
$ custom_exe_1234 $Variable_1 $Variable_2
Program was passed 3 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: Value_1
Arg #2: Value_2
Program Signature: 5998595441
```

The output shown above comes from the executable itself. The tester will verify the argument list matches the expanded values.

### Notes

- In this stage, support the simple `$VAR` syntax only. We'll get to supporting the `${VAR}` form in the later stages.  
