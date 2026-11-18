PATH directories supply completion candidates as well as executable locations. In this stage, you'll complete external executable names alongside builtins.

### Tab completion for executables

Candidates are executable filenames from directories in PATH. Keep the existing builtin candidates (`echo` and `exit`). This stage covers a prefix with one matching executable.

When the user types the beginning of an executable's name and presses `<TAB>`, your shell should complete it to the full executable name.

For example, if `custom_executable` exists in a directory listed in PATH, typing `custom` and pressing tab completes to `custom_executable ` (with a trailing space).

### Tests

The tester will create an executable file, such as `custom_executable`, and add its directory to the `PATH`. The filename varies between test runs.

It will then execute your program like this:

```bash
./your_program.sh
```

Next, the tester will simulate a user typing the start of the external command and pressing `<TAB>`:

```bash
$ custom<TAB>
$ custom_executable 
```

The tester will verify that your shell correctly completes the command to the external executable file name.

### Notes

- PATH can include directories that don't exist on disk, so your code should handle such cases gracefully.
