In this stage, you'll extend pipeline support to include shell built-in commands.

Built-in commands (like `echo`, `type`) need to be handled correctly when they appear as part of a pipeline, whether at the beginning, middle, or end.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send commands involving pipelines with built-ins:

```bash
$ echo raspberry\\nblueberry | wc
       1       1      20
$ ls | type exit
exit is a shell builtin
$
```

The tester will check if the final output matches the expected output after the pipeline execution, correctly handling the built-in commands.
For the `type` command, the tester will check if the command correctly handles the built-in command and prints the correct output, the `ls` output is not supposed to be printed.

### Notes

-   Built-in commands don't typically involve creating a new process via `fork`/`exec`. You'll need to handle their execution within the shell process while still managing the input/output redirection required by the pipeline.