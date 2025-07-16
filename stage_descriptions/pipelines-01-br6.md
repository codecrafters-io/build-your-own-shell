In this stage, you'll implement support for basic pipelines involving two external commands.

A [pipeline](https://www.gnu.org/software/bash/manual/bash.html#Pipelines) connects the standard output of one command to the standard input of the next command using the `|` operator.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then execute multiple pipelines with two commands in them. Examples:

```bash
$ cat /tmp/foo/file | wc
       5      10      77
```

```bash
$ tail -f /tmp/foo/file-1 | head -n 5
raspberry strawberry
pear mango
pineapple apple
# (tester appends more lines to /tmp/foo/file-1)
# (And expects the running command to keep printing new lines)
This is line 4.
This is line 5.
$
```

The tester will check if the final output matches the expected output after pipeline execution.

For the `tail -f` command, the tester will append content to the the input file while the pipeline is running.

### Notes

- The executables (`cat`, `wc`, `tail`, `head`) will be available in the `PATH`.
- To execute a pipeline you'll need to create a [pipe](https://en.wikipedia.org/wiki/Anonymous_pipe), [fork](https://en.wikipedia.org/wiki/Fork_(system_call))
  processes for each command, and set up the standard input/output redirection between them.