After moving backward through history, users need a way to move toward newer entries. In this stage, you'll add Down-arrow navigation.

### Moving toward newer commands

After Up selects an older entry, Down selects the next newer one. Replace the current input text with that entry without executing it. The prompt lines below show changes to the same input line.

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

The tester expects Down to display the next newer command relative to the entry currently shown.

### Notes

{{#lang_is_rust}}
- If you're using [rustyline](https://crates.io/crates/rustyline/) or [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline), check that Down moves toward newer entries without executing them. Adjust the library's defaults if needed.
{{/lang_is_rust}}

{{#lang_is_python}}
- If you're using [readline](https://docs.python.org/3/library/readline.html) or [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline), check that Down moves toward newer entries without executing them. Adjust the library's defaults if needed.
{{/lang_is_python}}

{{#lang_is_go}}
- If you're using [readline](https://pkg.go.dev/github.com/chzyer/readline) or [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline), check that Down moves toward newer entries without executing them. Adjust the library's defaults if needed.
{{/lang_is_go}}

{{#lang_is_java}}
- If you're using [JLine](https://github.com/jline/jline3) or [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline), check that Down moves toward newer entries without executing them. Adjust the library's defaults if needed.
{{/lang_is_java}}

{{#lang_is_csharp}}
- If you're using [Readline.Ext](https://www.nuget.org/packages/ReadLine.Ext) or [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline), check that Down moves toward newer entries without executing them. Adjust the library's defaults if needed.
{{/lang_is_csharp}}

{{^lang_is_rust}}
{{^lang_is_python}}
{{^lang_is_go}}
{{^lang_is_java}}
{{^lang_is_csharp}}
- If you're using [readline](https://en.wikipedia.org/wiki/GNU_Readline), check that Down moves toward newer entries without executing them. Adjust the library's defaults if needed.
{{/lang_is_csharp}}
{{/lang_is_java}}
{{/lang_is_go}}
{{/lang_is_python}}
{{/lang_is_rust}}
