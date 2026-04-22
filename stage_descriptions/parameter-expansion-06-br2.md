In this stage, you'll add support for parameter expansion using the `${VAR}` form.

### Expansion with braces

Without braces, `$FOObar` is read as the variable `FOObar`. Wrapping the name in braces — `${FOO}bar` — tells the shell exactly where the name ends, so `FOO` is expanded and `bar` is appended as literal text.

```bash
$ declare Var1=foo
$ declare Var2=bar
$ echo ${Var1}end
fooend
$ echo ${Var1}and${Var2}
fooandbar
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will set variables and run commands as follows:

```bash
$ declare Item=widget
$ declare Foo1=Bar2
$ ./custom_exe_1234 stock_${Item}_id ${Foo1}
Program was passed 3 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: stock_widget_id
Arg #2: Bar2
Program Signature: 5998595441
```

The tester will verify the printed output matches the fully expanded line.
