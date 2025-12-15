In this stage, you'll implement support for pipelines involving more than two commands.

Pipelines can chain multiple commands together, connecting the output of each command to the input of the next one.

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
- Proper process cleanup and waiting are crucial.
