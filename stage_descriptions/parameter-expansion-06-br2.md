Braces mark where a variable name ends when literal text follows it. In this stage, you'll add parameter expansion using `${VAR}`.

### Expansion with braces

Without braces, `$FOObar` names the variable `FOObar`. In `${FOO}bar`, the closing brace ends the name. Expand `FOO` and keep the following `bar` as literal text in the same word.

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
$ custom_exe_1234 stock_${Item}_id ${Foo1}
Program was passed 3 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: stock_widget_id
Arg #2: Bar2
Program Signature: 5998595441
```

The tester will verify the printed output matches the fully expanded line.
