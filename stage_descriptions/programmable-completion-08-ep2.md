In this stage, you'll extend command-based completion so a completer script can supply multiple candidates.

### Multiple candidates from a `-C` completer

The completer writes candidates to stdout as newline-separated entries (`\n`). Each output line is one completion candidate, the same as in the earlier stages.

For example:

If the completer script always prints the following to stdout:
```
clone
push
add
```

```bash
$ complete -C /path/to/completer_script git
$ git <TAB>
add  clone  push
```

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

The tester will then create a completer script that will always print the following to the stdout:
```
add
commit
push
```

It will register a command-based completion rule for `git` and attempt a completion.

```bash
$ complete -C /path/to/completer_script git
# First tab rings bell 
# Second tab displays the completion options followed by the prompt line
$ git <TAB>
add  commit  push
$ git 
```

The tester will verify that all the completion options offered by the completer script are shown in the next line as completion options with at least one space in between, followed by the prompt from the previous line.

### Notes

- You don't need to implement the Longest Common Prefix (LCP) completion yet.
