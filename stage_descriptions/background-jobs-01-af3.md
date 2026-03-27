In this stage, you'll register the `jobs` builtin.

### Background Jobs

Normally, when you run a command in the shell, the shell waits for it to finish before showing the prompt again. This is called running a command in the foreground.

However, you can also run commands in the background by adding `&` at the end. Background commands run without blocking the shell, so you can continue typing other commands while they execute.

For example:
```bash
$ sleep 10 &
[1] 12345
$ echo "I can run this immediately"
I can run this immediately
$
```

The shell assigns each background command a job number (like `[1]`) and a process ID (like `12345`).

### The `jobs` Builtin

The [`jobs`](https://www.man7.org/linux/man-pages/man1/jobs.1p.html) builtin lists all the background jobs that are currently known to the shell. It shows their job numbers, status (e.g., `Running` or `Done`), and the commands themselves.

For this stage, you'll register `jobs` as a builtin but provide an empty implementation. When there are no background jobs, the `jobs` command should produce no output and simply return to the prompt.

For example:
```bash
$ type jobs
jobs is a shell builtin
$ jobs
$ 
```

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will then verify that `jobs` is registered as a builtin:
```bash
$ type jobs
# Expected
jobs is a shell builtin

# Empty output expected
$ jobs
$ 
```

The tester will verify that:
- `type jobs` reports it as a shell builtin
- The `jobs` command produces no output when called


### Notes

- The actual implementation of `jobs` (listing running background jobs) will be covered in later stages. For now, just register it as a builtin with an empty implementation.
