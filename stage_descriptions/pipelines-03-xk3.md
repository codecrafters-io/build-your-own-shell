Longer pipelines combine several programs through the same input/output connections. In this stage, you'll extend pipeline support to three or more commands.

### Chaining commands

Each intermediate command consumes the previous command's output and supplies input to the next. The first command keeps its usual input, and the last command sends its output to the terminal unless redirected. Intermediate stdout streams belong to their pipes and should not also be printed by the shell.

Before starting, add support for double-quoted arguments as taught in the Quoting extension. The `grep "file"` example below must pass `file` without the grouping quotes.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send commands involving pipelines with three or more stages:

```bash
$ cat /tmp/foo/file | head -n 3 | wc
       3       3      10
$ ls -la /tmp/foo | tail -n 5 | head -n 3 | grep "file"
-rw-r--r-- 1 user user     5 Apr 29 10:06 file
$
```

The tester will check if the final output matches the expected output after the multi-stage pipeline execution.

### Notes

- This requires managing multiple pipes and processes.
- Ensure correct setup of stdin/stdout for each command in the chain (except the first command's stdin and the last command's stdout, which usually connect to the terminal or file redirections).
- Keep the commands able to run concurrently and collect their exit statuses. As in a two-command pipeline, an unused open pipe end can prevent a reader from reaching end-of-file.
