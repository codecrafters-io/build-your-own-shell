In this stage, you'll extend your shell's tab completion to include external executable files in the user's `PATH`.

### Tab Completion for Executables

In previous stages, you implemented tab completion for builtin commands (`echo` and `exit`). Now you'll extend completion to include external executables found in the PATH environment variable.

When the user types the beginning of an executable's name and presses `<TAB>`, your shell should complete it to the full executable name.

For example, if `custom_executable` exists in a directory listed in PATH, typing `custom` and pressing tab completes to `custom_executable ` (with a trailing space).

### Tests

The tester will create an executable file named `custom_executable` and add its directory to the `PATH`.

It will then execute your program like this:

```bash
./your_program.sh
```

The test will simulate the user typing the start of the external command and pressing `<TAB>`:

```bash
$ custom<TAB>
$ custom_executable 
```

The tester will verify that your shell correctly completes the command to the external executable filename.

### Notes

- PATH can include directories that don't exist on disk, so your code should handle such cases gracefully.
