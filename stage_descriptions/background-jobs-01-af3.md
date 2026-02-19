In this stage, you'll register the `jobs` builtin.

### The `jobs` Builtin

The [`jobs`](https://www.man7.org/linux/man-pages/man1/jobs.1p.html) lists the background jobs that are currently known to the shell. When you run a command with & at the end, the shell runs it in the background and gives it a job number. jobs shows those jobs and their status (e.g. running or done).

For example:

```bash
# No ongoing background jobs
$ jobs
$
```

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

# Empty output expected
$ jobs
$ 
```

### Notes

- In this stage, you'll register `jobs` as a built-in and write an empty implementation for it. You don't need to write the actual implementation of it yet, we'll get to that in the later stages.