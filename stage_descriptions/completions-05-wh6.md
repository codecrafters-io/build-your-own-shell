In this stage, you'll implement tab completion for executables, specifically when multiple executables share a common prefix.

When the user types a command prefix and presses `<TAB>`, your shell should:

- Identify all executables in the `PATH` that match the prefix.
- If there are multiple matches,
  - On the first TAB press, just ring a bell. (`\a` rings the bell)
  - On the second TAB press, print all the matching executables separated by 2    spaces, on the next line, and follow it with the prompt on a new line.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then set up a specific `PATH` and place multiple executables starting with a common prefix into different directories in the `PATH`. Finally, it will type the common prefix, and then press the Tab key twice.

```bash
$ ./your_program.sh
$ xyz_<TAB><TAB>
xyz_bar  xyz_baz  xyz_quz
$ xyz_
```

The tester will verify that:

1. Your shell displays the prompt with the common prefix after receiving the partial command.
2. Upon the first Tab key press, your shell prints a bell character.
3. Upon the second Tab key press, your shell prints the list of matching executables separated by 2 spaces, on the next line, and follow it with the prompt on a new line.