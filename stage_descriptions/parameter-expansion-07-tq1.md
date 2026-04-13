In this stage, you'll ensure that redeclaring a variable without changing its attributes preserves existing attributes such as export.

### Redeclaration

For an existing variable, re-declaration updates the existing value. If no flags are supplied, the flags from the previous declaration are preserved.

For example:

```bash
# Old -x flag is preserved in case of no flags
$ declare -x foo=old
$ declare foo=new
$ declare -p foo
declare -x foo="new"
```

```bash
# New flag overrides the previous one if supplied
$ declare bar=baz
$ declare -p bar
declare -- bar="baz"
$ declare -x bar="newbaz"
$ declare -p bar
declare -x bar="newbaz"
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will verify that redeclaring an exported variable without flags keeps the export attribute and updates only the value:

```bash
$ declare -x foo=old
$ declare foo=new
$ declare -p foo
declare -x foo="new"
```

It will also verify that when a new declaration supplies `-x`, the exported attribute is applied accordingly:

```bash
$ declare bar=baz
$ declare -p bar
declare -- bar="baz"
$ declare -x bar=newbaz
$ declare -p bar
declare -x bar="newbaz"
```

The tester will check that each `declare -p` line matches the expected form and value.
