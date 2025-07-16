In this stage, you'll extend your shell's tab completion to include external executable files in the user's `PATH`.

Your shell should now be able to complete commands that are not built-ins, but exist as executable files in the directories listed in the `PATH` environment variable.
When the user types the beginning of an external command and presses `<TAB>`, your shell should complete the command to the full executable file name.
This means that if you have a command `custom_executable` in the path and type `custom` and press `<TAB>`, the shell should complete that to `custom_executable`.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

Before executing your shell, the tester will create an executable file named `custom_executable` and add its directory to the `PATH`.

The test will simulate the user typing the start of the external command and pressing `<TAB>`:

1.  **Input:** `custom`<TAB>
    *   The tester types "custom" and presses `<TAB>`. The tester expects that the prompt line changes to <code>custom_executable  </code>.

The tester will verify that your shell correctly completes the command to the external executable file name. Note the space at the end of the completion.

### Notes

- PATH can include directories that don't exist on disk, so your code should handle such cases gracefully.