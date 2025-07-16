In this stage, you'll extend your shell's tab completion to handle cases with multiple matching executables where one is a prefix of another.

When the user types a partial command and presses the Tab key, your shell should attempt to complete the command name. If there are multiple executable files in the PATH that match the prefix, and one of those matches is a prefix of another, then the shell should complete to the longest common prefix of all matching executables. If there is only one match after performing completion, then the shell should complete the command name as in previous stages.

For example, if `xyz_foo`, `xyz_foo_bar`, and `xyz_foo_bar_baz` are all available executables and the user types `xyz_` and presses tab, then your shell should complete the command to `xyz_foo`. If the user then types `_` and presses tab again, it should complete to `xyz_foo_bar`. If the user then types `_` and presses tab again, it should complete to `xyz_foo_bar_baz`.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It will then set up a specific `PATH` and place executables `xyz_foo`, `xyz_foo_bar`, and `xyz_foo_bar_baz` into different directories in the `PATH`. Finally, it will type `xyz_` and then press Tab, then type `_` and press Tab, then type `_` and press Tab.

```bash
$ export PATH=/tmp/bar:$PATH
$ export PATH=/tmp/baz:$PATH
$ export PATH=/tmp/qux:$PATH
$ ./your_program.sh
$ xyz_<TAB>
$ xyz_foo_<TAB>
$ xyz_foo_bar_<TAB>
$ xyz_foo_bar_baz
```
Note: The prompt lines above are on the same line.

The tester will verify that:

1. After typing `xyz_` and pressing Tab, your shell completes to `xyz_foo`.
2. After typing `_`, the prompt line matches `$ xyz_foo_`.
3. After typing `_` and pressing Tab, your shell completes to `xyz_foo_bar`.
4. After typing `_`, the prompt line matches `$ xyz_foo_bar_`.
5. After typing `_` and pressing Tab, your shell completes to `xyz_foo_bar_baz`.
6. The prompt line matches `$ xyz_foo_bar_baz ` after the final completion.