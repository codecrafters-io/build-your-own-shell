In this stage, you'll implement tab completion for multiple executables that share a common prefix.

### Handling Multiple Matches

When a user types a command prefix and presses `<TAB>`, your shell should find all executables in PATH that match the prefix and do the following:

1. On the first `<TAB>` press, ring the bell (using `\x07`).
2. On the second `<TAB>` press:
    - Print all matching executables on a new line. List them in **alphabetical order**, separated by two spaces (<code style="white-space: pre;">  </code>).
    - Show the prompt again on the next line, keeping the original command prefix.
 
For example:

```bash
$ xyz_<TAB><TAB>
xyz_bar  xyz_baz  xyz_quz
$ xyz_
```

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then set up a specific `PATH` and place multiple executables starting with a common prefix into different directories in the `PATH`.

Finally, it will type the common prefix, and then press the tab key twice.

```bash
$ xyz_<TAB><TAB>
xyz_bar  xyz_baz  xyz_quz
$ xyz_
```

The tester will verify that:
1. The first tab press rings the bell.
2. The second tab press displays all matching executables in alphabetical order.
    - The matches are separated by two spaces.
    - The matches are displayed on a new line.
3. The prompt reappears with the original input preserved.
