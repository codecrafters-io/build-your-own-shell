In this stage, you'll add support for expanding the variable name when it is not set.

### Unset names in expansion

When a variable is not set, it expands to an empty string — it contributes nothing to the word. Any literal text around it is still kept.

```bash
$ declare greeting=hello
$ echo ${greeting}world
helloworld
$ echo ${missing}world
world
```

`${missing}` is unset, so it expands to nothing and only `world` remains.
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

Note that `${missing2}` expands to an empty string with no surrounding text, so the shell produces an empty word and drops it entirely — no third argument is passed.

The tester will verify the child process receives exactly those arguments after the program name.