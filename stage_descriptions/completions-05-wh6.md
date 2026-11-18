Several executables can match the same prefix, leaving the shell without a unique choice. In this stage, you'll list matching command names on request.

### Handling multiple matches

When a user types a command prefix and presses `<TAB>`, your shell should find all executables in PATH that match the prefix and do the following:

1. On the first `<TAB>` press, ring the bell (using `\x07`).
2. On the second `<TAB>` press:
    - Print all matching executables on a new line. List them in **alphabetical order**, separated by at least one space (two spaces are recommended for readability).
    - Show the prompt again on the next line, keeping the original command prefix.
 
In this stage, keep the input unchanged on the first Tab press. Completing an additional shared portion of the names comes in later stages.

For example:

```bash
$ xyz_<TAB><TAB>
xyz_bar  xyz_baz  xyz_quz
$ xyz_
```

### Tests

The tester will place executables with a common prefix in several PATH directories. It will then start your program with that PATH:

```bash
./your_program.sh
```

It will type the common prefix and press the tab key twice.

```bash
$ xyz_<TAB><TAB>
xyz_bar  xyz_baz  xyz_quz
$ xyz_
```

The tester will verify that:
1. The first tab press rings the bell.
2. The second tab press displays all matching executables in alphabetical order.
    - The matches are separated by at least one space.
    - The matches are displayed on a new line.
3. The prompt reappears with the original input preserved.
