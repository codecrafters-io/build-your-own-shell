In this stage, you'll add support for parameter expansion using the `${VAR}` form.

### Expansion with braces

Braces mark the exact boundary of a variable name. When a variable is followed immediately by other characters, the shell needs to know where the name ends and where literal text begins — braces make that boundary explicit.

For example, `$FOO_bar` is treated as a reference to a variable named `FOO_bar`, not `FOO` followed by `_bar`. Writing `${FOO}_bar` removes the ambiguity: the shell expands `FOO` and then appends `_bar` as literal text.

For example:

```bash
$ declare Var1=foo
$ declare Var2=bar
$ echo appended is ${Var1}_end
appended is foo_end
$ echo joined is ${Var1}_and_${Var2}
joined is foo_and_bar
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will set variables and run commands (including builtins such as `echo` if your shell implements them) where words contain `${VAR}` with literal text immediately after the closing brace. For example:

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
