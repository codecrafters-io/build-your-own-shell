In this stage, you'll handle completer scripts that return multiple completion candidates.

### Multiple Candidates

A completer script can return more than one candidate by printing each one on a separate line to stdout. When multiple candidates are returned, your shell should display them all to the user instead of completing immediately.

For example, if the completer script prints:

```
add
commit
push
```

And the user presses TAB:

```bash
$ git <TAB><TAB>
add  commit  push
$ git 
```

The first TAB should ring the terminal bell (since there's no unique completion). The second TAB should display all candidates on the next line, separated by at least two spaces, sorted alphabetically. After displaying the candidates, the shell should reprint the prompt with the original input.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

It will then register a completer script that always returns three candidates (`add`, `commit`, `push`):

```bash
$ complete -C /path/to/completer_script git
$ git <TAB><TAB>
add  commit  push
$ git 
```

The tester will verify that:

- The first TAB rings the bell (no unique match)
- The second TAB displays all candidates on one line, separated by at least two spaces
- The candidates are sorted alphabetically
- The prompt and original input are reprinted after the candidate list

### Notes

- You don't need to implement longest common prefix (LCP) completion yet. That comes in a later stage.
- The display format matches how Bash shows multiple completions: candidates on one line with at least two spaces between them.
