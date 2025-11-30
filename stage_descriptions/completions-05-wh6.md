In this stage, you'll implement tab completion for multiple executables that share a common prefix.

### Handling Multiple Matches

When the user types a command prefix and presses `<TAB>`, your shell should identify all executables in PATH that match the prefix and follow these steps:

1. On the first `<TAB>` press, ring the bell (using `\x07`).
2. On the second `<TAB>` press:
    - Print all matching executables on a new line. They must be in **alphabetical order** and separated by two spaces (<code style="white-space: pre;">  </code>).
    - Display the initial prompt on the next line.
 
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
