In this stage, you'll implement printing a shell prompt (`$ `) and waiting for user input.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

The tester will then check whether your shell prints the `$ ` prompt and waits for user input.

### Notes

- There's a space after the `$` character in the prompt.
- Your program must not exit after printing `$ `, it should wait for user input.
- We'll handle reading commands and executing them in later stages, this stage only deals with printing the prompt.