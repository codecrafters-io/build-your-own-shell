In this stage, you'll add support for storing and displaying shell variables.

### Declaring shell variables

With `declare NAME=VALUE`, the shell records a shell variable and its value. With `declare -p NAME`, the shell prints a line describing that variable. The output for the default case is always `declare -- NAME="VALUE"`.

For example:

```bash
$ declare foo=bar
$ declare -p foo
declare -- foo="bar"
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then define a variable with `declare` and ask for its description:

```bash
$ declare foo=bar
$ declare -p foo
declare -- foo="bar"
$ declare -p non_existent_variable
declare: non_existent_variable: not found
```

The tester will verify the output matches the expected format for the existing and non-existing variables.
