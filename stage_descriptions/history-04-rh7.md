Recalling an earlier command saves the user from retyping it. In this stage, you'll use the Up arrow to recall history into the current input line.

### Recalling older commands

The first Up press shows the most recent command. Further presses move toward older entries. Each press replaces the editable text after the prompt, without executing the recalled command. The prompt lines below show changes to the same input line.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then send multiple commands to your shell, followed by the up arrow to recall the history:

```bash
$ echo hello
hello
$ echo world
world
<UP ARROW>
$ echo world
<UP ARROW>
$ echo hello
```

The tester will expect the previous commands to be displayed when the up arrow key is pressed.

### Notes

{{#lang_is_rust}}
- We recommend using a library like [rustyline](https://crates.io/crates/rustyline/) for your implementation. A line-editing library handles keyboard input and display updates, as [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) does. You may need to adjust the library's default behavior to match the stage's requirements.
{{/lang_is_rust}}

{{#lang_is_python}}
- We recommend using the module [readline](https://docs.python.org/3/library/readline.html) for your implementation. A line-editing library handles keyboard input and display updates, as [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) does. You may need to adjust the library's default behavior to match the stage's requirements.
{{/lang_is_python}}

{{#lang_is_go}}
- We recommend using a library like [readline](https://pkg.go.dev/github.com/chzyer/readline) for your implementation. A line-editing library handles keyboard input and display updates, as [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) does. You may need to adjust the library's default behavior to match the stage's requirements.
{{/lang_is_go}}

{{#lang_is_java}}
- We recommend using a library like [JLine](https://github.com/jline/jline3) for your implementation. A line-editing library handles keyboard input and display updates, as [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) does. You may need to adjust the library's default behavior to match the stage's requirements.
{{/lang_is_java}}

{{#lang_is_csharp}}
- We recommend using a library like [Readline.Ext](https://www.nuget.org/packages/ReadLine.Ext) for your implementation. A line-editing library handles keyboard input and display updates, as [GNU readline](https://www.wikiwand.com/en/articles/GNU_Readline) does. You may need to adjust the library's default behavior to match the stage's requirements.
{{/lang_is_csharp}}

{{^lang_is_rust}}
{{^lang_is_python}}
{{^lang_is_go}}
{{^lang_is_java}}
{{^lang_is_csharp}}
- We recommend using a library like [readline](https://en.wikipedia.org/wiki/GNU_Readline) for your implementation. A line-editing library can handle keyboard input and display updates. You may need to adjust its default behavior to match the stage's requirements.
{{/lang_is_csharp}}
{{/lang_is_java}}
{{/lang_is_go}}
{{/lang_is_python}}
{{/lang_is_rust}}
