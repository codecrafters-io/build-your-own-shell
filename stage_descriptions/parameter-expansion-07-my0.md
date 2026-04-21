In this stage, you'll add support for expanding the variable name when it is not set.

### Unset names in expansion

When `NAME` is not set, `${NAME}` or `$NAME` contributes nothing to the word.  Literal characters that follow `}` still become part of the same shell word. Several `${...}` pieces in one argument can therefore collapse to a shorter string or drop out entirely, which changes how many arguments the program receives.

For example:

```bash
$ declare existing=existingsvalue
$ ./custom_exe_1234 ${missing1}end ${existing} ${missing2}
Program was passed 3 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: end
Arg #2: existingsvalue
Program Signature: 5998595441
```

Here only two arguments are passed after the program name: `end` (from empty `${missing1}` plus literal `end`) and `existingsvalue` (from `${existing}`). `${missing2}` adds nothing.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will declare `existing`, leave `missing1` and `missing2` unset, and run:

```bash
$ declare existing=existingsvalue
$ ./custom_exe_1234 ${missing1}end ${existing} ${missing2}
Program was passed 3 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: end
Arg #2: existingsvalue
Program Signature: 5998595441
```

The tester will verify the child process receives exactly those arguments after the program name.
