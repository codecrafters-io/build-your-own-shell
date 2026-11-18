Builtin output can participate in a pipeline just as an external program's output does. In this stage, you'll add builtins to your two-command pipelines.

### Builtins in a pipeline

For this stage, a builtin can appear on either side of `|`. It uses the same pipe connections as an external program. Pipelines with more than two commands come in later stages.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send commands involving pipelines with built-ins:

```bash
$ echo apple-orange | wc
       1       1      13
$ ls | type exit
exit is a shell builtin
$
```

The tester checks the final pipeline output. In `ls | type exit`, `type` doesn't read its input, but the connection still sends `ls` output into the pipe. Only `type` produces terminal output.

### Notes

- Your shell already contains the builtin implementation. It may run that code in the shell process or a child process, provided the pipeline's input/output behavior is correct. There is no requirement to locate an external executable for the builtin.
