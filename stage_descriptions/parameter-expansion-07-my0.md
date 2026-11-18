An unset variable contributes empty text while any surrounding literal text remains. In this stage, you'll handle unset names in `$VAR` and `${VAR}` expansions.

### Unset names in expansion

For the unquoted words in this stage, a word made entirely from empty expansions produces no argument. A word with surrounding literal text still produces an argument containing that text.

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
$ custom_exe_1234 ${missing1}end ${existing} ${missing2}
Program was passed 3 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: end
Arg #2: existingsvalue
Program Signature: 5998595441
```

Here `${missing2}` is unquoted and has no surrounding text, so it contributes no argument. The child receives only `end` and `existingsvalue` after the program name.

The tester will verify the child process receives exactly those arguments after the program name.

### Notes

- If your shell already supports quoting, keep empty quoted arguments. This stage tests unquoted expansions, so adding quoting support is not required here.
