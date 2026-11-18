Programmable completion lets an external script supply suggestions for a particular command. In this stage, you'll make `type` recognize `complete` as a shell builtin.

### The `complete` builtin

The [`complete`](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html#index-complete) builtin associates a command name with a source of completion suggestions. In this extension, that source will be an executable script. Your existing `type` builtin supplies the recognition behavior needed for this first step.

Registering script paths and invoking scripts come in later stages.

The following examples show the extension's eventual behavior. A user can register a completer script for `git`:

```bash
$ complete -C /path/to/completer_script git
```

Once registered, the shell will invoke the script when the user presses TAB after `git` to get suggestions:

```bash
$ git clo<TAB>
$ git clone 
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then check that `complete` is recognized as a builtin:

```bash
$ type complete
complete is a shell builtin
```
