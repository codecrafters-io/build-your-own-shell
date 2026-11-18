Expansion lets users reuse the text they assigned with `declare`. In this stage, you'll replace `$VAR` with its stored value in command words.

### Expansion

When a command line contains `$NAME` and `NAME` is a variable, the shell replaces `$NAME` with the variable's value before invoking builtins or external programs.

The substitution happens within command words before they are passed to a builtin or external program. It leaves the stored value unchanged. A literal prefix and an expansion in the same word stay together: if `NAME` contains `report`, `file_$NAME` becomes the single argument `file_report`.

The name after `$` extends through letters, digits, and underscores under the identifier rules from earlier stages. Braces will let users mark the end of a name explicitly in later stages.

For example:

```bash
$ declare Variable_1=value
$ declare Variable_2=value2
$ echo $Variable_1 $Variable_2
value value2
```

Here `echo` receives the two expanded words `value` and `value2`. The shell performs the substitutions before calling `echo`.

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
Arg #2: Value2
Program Signature: 5998595441
```

The output shown above comes from the executable itself. The tester verifies that the argument list matches the expanded values, including any literal text surrounding an expansion.

### Notes

- In this stage, support the simple `$VAR` syntax only. We'll get to supporting the `${VAR}` form in the later stages.  
- If your shell already supports quoting, preserve its behavior: single quotes keep `$VAR` literal, while double quotes allow expansion and keep the result within one argument.
