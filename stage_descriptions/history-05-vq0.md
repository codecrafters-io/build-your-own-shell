In this stage, you'll add support for recalling history with the down arrow key.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the up and then down arrow keys to recall the history:

```bash
$ echo hello
hello
$ echo world
world
<UP ARROW>
$ echo world
<UP ARROW>
$ echo hello
<DOWN ARROW>
$ echo world
```

The tester will expect the previous commands to be displayed when the down arrow key is pressed.

### Notes

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

{{#lang_is_csharp}}
- We recommend using a library like [Readline.Ext](https://www.nuget.org/packages/ReadLine.Ext) for your implementation. Most modern shells and REPLs (like the Python REPL) use [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.
{{/lang_is_csharp}}

{{^lang_is_rust}}
{{^lang_is_python}}
{{^lang_is_go}}
{{^lang_is_java}}
{{^lang_is_csharp}}
- We recommend using a library like [readline](https://en.wikipedia.org/wiki/GNU_Readline) for your implementation. Most modern shells and REPLs (like the Python REPL) use readline under the hood. While you may need to override some of its default behaviors, it's typically less work than starting from scratch.
{{/lang_is_csharp}}
{{/lang_is_java}}
{{/lang_is_go}}
{{/lang_is_python}}
{{/lang_is_rust}}