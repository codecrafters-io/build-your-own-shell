In this stage, you'll register the `jobs` builtin.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then use the type built-in on `jobs`.

```bash
$ type jobs
# Expected
jobs is a shell builtin

# No output expected
$ jobs
$
```

### Notes

- In this stage, you'll register `jobs` as a built-in and write an empty implementation for it.

<!-- This stage is before the & launch stage because of the simplicity -->

Implementation load:
 2 files changed, 13 insertions(+), 2 deletions(-)