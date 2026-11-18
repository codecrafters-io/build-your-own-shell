Defined variables need to retain their values for later commands. In this stage, you'll store values with `declare NAME=VALUE` and display them with `declare -p NAME`.

### Declaring shell variables

With `declare NAME=VALUE`, the shell records a shell variable and its value. With `declare -p NAME`, the shell prints a line describing that variable. The output of `declare -p NAME` is `declare -- NAME="VALUE"`.

Values remain available for later commands in the same shell session. Assigning the same name again replaces its value and produces no output. The double quotes in the printed description are literal output characters.

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
$ declare -p missing_variable
declare: missing_variable: not found
$ declare foo=bar2
$ declare -p foo
declare -- foo="bar2"
```

The tester will verify the output matches the expected format for the existing and non-existing variables.
