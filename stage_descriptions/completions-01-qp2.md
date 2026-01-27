In this stage, you'll implement support for autocompleting builtin commands.

### Tab Autocompletion

Tab completion is a shell feature that helps users complete commands by pressing the `<TAB>` key.

For this stage, you'll implement autocompletion for two builtin commands: `echo` and `exit`.

When the user types a partial command and presses `<TAB>`, your shell should:

1.  Check if the partial text matches the beginning of a builtin command (specifically `echo` or `exit`).
2.  If there is a match, complete the word.
3.  Add a trailing space so the user can immediately type arguments.

For example, if a user types `ech` and presses tab, your shell should complete it to `echo ` (with a space at the end).

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ ech<TAB>
$ echo 

$ exi<TAB>
$ exit 
```

The tester will verify that:
- Pressing tab after `ech` completes to `echo `
- Pressing tab after `exi` completes to `exit `

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
