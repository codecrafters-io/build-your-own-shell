In this stage, you'll add support for parameter expansion using the `${VAR}` form.

### Expansion with braces

Braces make the end of the variable name explicit, which matters when the name is followed by characters that would otherwise be treated as part of the name or as literal text to concatenate.

The shell expands `${NAME}` the same way it expands `$NAME` for a simple identifier, so literal suffixes and neighboring expansions parse unambiguously. For instance, `$FOO_suffix` would refer to a different variable name entirely. `${FOO}_suffix` expands `FOO` and leaves `_suffix` as literal text after it.

For example:

```bash
$ export BAZ=qux
$ FOO=bar
$ echo appended is ${FOO}_suffix
appended is bar_suffix
$ echo joined is ${FOO}_${BAZ}_tail
joined is bar_qux_tail
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will set variables and run commands (including builtins such as `echo` if your shell implements them) where words contain `${VAR}` with literal text immediately after the closing brace. For example:

```bash
$ export ITEM=widget
$ declare FOO=BAR
$ ./custom_exe_1234 stock_${ITEM}_id ${FOO}
Program was passed 2 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: stock_widget_id
Arg #2: BAR
Program Signature: 5998595441
```

The tester will verify the printed output matches the fully expanded line.
