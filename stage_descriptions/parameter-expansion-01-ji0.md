In this stage, you'll register the `declare` builtin.

### The `declare` builtin

The shell uses the `declare` builtin to create and inspect shell variables. For example,

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

### Notes

- In this stage, you only need to register the `declare` builtin. We'll get to implementing its behavior in the later stages.
