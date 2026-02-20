In this stage, you'll add support for file completion in working directory.

### Filename Completion

When the user presses `<TAB>` while typing an argument:

1. Look for files in the present working directory.
2. Find files whose names start with the typed prefix.
3. Complete the filename and add a trailing space.

The argument completion does not depend on the command.

For example,

```bash
$ cat re<TAB>

# In the same line
$ cat readme.txt
```

### Tests

The tester will create a single file in the present working directory, eg. `readme.txt`.

The tester will then execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ cat re<TAB>

# In the same line
# With a trailing space
$ cat readme.txt
```

The tester will verify that:

- Pressing tab after `cat re` completes to `cat readme.txt`
- A trailing space is inserted after the completion since the completion was made for a file path.

### Notes

- In this stage, you'll only need to match the prefix against the entry in the current working directory. We'll get to implementing completion in case of nested directories in the later stages.

- In this stage, you'll only need to handle cases of single matching filename, we'll get to implementing completion in cases of directories, and multiple completions in the later stages.

{{#lang_is_rust}}
- We recommend using a library like [rustyline](https://crates.io/crates/rustyline/) for your implementation. Most modern shells and REPLs (like the Python REPL) use [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.
{{/lang_is_rust}}

{{#lang_is_python}}
- We recommend using the module [readline](https://docs.python.org/3/library/readline.html) for your implementation. Most modern shells and REPLs (like the Python REPL) use [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.
{{/lang_is_python}}

{{#lang_is_go}}
- We recommend using a library like [readline](https://pkg.go.dev/github.com/chzyer/readline) for your implementation. Most modern shells and REPLs (like the Python REPL) use [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.
{{/lang_is_go}}

{{#lang_is_java}}
- We recommend using a library like [JLine](https://github.com/jline/jline3) for your implementation. Most modern shells and REPLs (like the Python REPL) use [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.
{{/lang_is_java}}

{{^lang_is_rust}}
{{^lang_is_python}}
{{^lang_is_go}}
{{^lang_is_java}}
- We recommend using a library like [readline](https://en.wikipedia.org/wiki/GNU_Readline) for your implementation. Most modern shells and REPLs (like the Python REPL) use readline under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.
{{/lang_is_java}}
{{/lang_is_go}}
{{/lang_is_python}}
{{/lang_is_rust}}

- Different shells handle autocompletion differently. For consistency, we recommend using [Bash](https://www.gnu.org/software/bash/) for development and testing.