A pipeline lets one program consume another's output without an intermediate file. In this stage, you'll connect two external commands so they can exchange data while running.

### Connecting command streams

A [pipeline](https://www.gnu.org/software/bash/manual/bash.html#Pipelines) connects the standard output of one command to the standard input of the next command using the `|` operator.

Standard input (stdin) is a program's input stream. An operating-system pipe supplies a connection with a writing end and a reading end. Bytes written by the first command become available to the second command through that connection. The second command's output still goes to the terminal.

The commands need to run concurrently: the second must be able to read while the first is still producing output. Waiting for the first command to finish before starting the second would fail for a producer such as `tail -f`, which waits for more data.

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

Here, `cat` writes the file's contents, and `wc` reports the number of lines, words, and bytes it reads. These are supplied executables. Your shell's task is to connect them.

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

For the `tail -f` command, the tester appends content to the input file while the pipeline is running. `head -n 5` prints the first five lines it receives and then finishes. The comments in the example describe tester actions.

### Notes

- The executables (`cat`, `wc`, `tail`, `head`) will be available in the `PATH`.
- Your language may expose a [pipe](https://en.wikipedia.org/wiki/Anonymous_pipe) directly or through its process API. Unix programs can launch children with [fork](https://en.wikipedia.org/wiki/Fork_(system_call)). Higher-level process APIs are also suitable.
- A pipe reader sees end-of-file only after every open copy of its writing end is closed. Unused open ends can keep a command waiting after the producer has finished.
