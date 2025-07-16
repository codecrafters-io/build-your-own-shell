In this stage, you'll refine your shell's tab completion behavior to handle cases where the user types an invalid command.

When the user types a command that is not a known builtin and presses `<TAB>`, your shell should not attempt to autocomplete it. Instead, it should just keep what the user typed and should ring a bell.
This means that if you type "xyz" and press `<TAB>`, the command should not change and you should hear a bell indicating that there are no valid completion options for "xyz".

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

The tests will simulate the user typing an invalid command and pressing the `<TAB>` key:

1.  **Input:** `xyz`<TAB>
    *   The tester will first type `xyz` and then press `<TAB>`. The tester expects that the prompt still shows "xyz" and there is a bell sound.

The tester will verify that your shell does not attempt completion on invalid commands, the bell is sent.
The bell is sent by printing `\x07`, the [bell character](https://en.wikipedia.org/wiki/Bell_character).