In this stage, you'll handle completer scripts that return multiple completion candidates.

### Multiple Candidates

A completer script can return more than one candidate by printing each one on a separate line to stdout.

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

1. The first TAB should ring the terminal bell (since there's no unique completion).
2. The second TAB should display all candidates on the next line, sorted alphabetically and separated by at least one space (two spaces are recommended for readability).

After displaying the candidates, the shell should reprint the prompt with the original input.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
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
- The second TAB displays all candidates on one line, separated by at least one space
- The candidates are sorted alphabetically
- The prompt and original input are reprinted after the candidate list

### Notes

- You don't need to implement longest common prefix (LCP) completion yet. We'll get to that in later stages.
