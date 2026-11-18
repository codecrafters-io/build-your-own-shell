Shell variables let users name text and reuse it in commands. In this stage, you'll make `type` recognize the `declare` builtin.

### The `declare` builtin

The `declare` builtin creates and inspects named text values held by the running shell. These are values entered by the shell's user, separate from variables in the source code you write. The following example shows the eventual behavior. Only `type declare` is required in this stage:

```bash
$ type declare
declare is a shell builtin
$ declare variable=value
$ declare -p variable
declare -- variable="value"
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then verify that `declare` is registered as a builtin:

```bash
$ type declare
declare is a shell builtin
```
