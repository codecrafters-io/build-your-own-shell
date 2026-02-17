In this stage, you'll implement support for printing error messages for invalid commands.

Example:

```
$ xyz
xyz: command not found
```

Your program should:

- Read the user’s input by line
- Print an error message in exactly this format: `{command}: command not found`
  - e.g. if the user types `xyz`, print `xyz: command not found`

For now, we'll treat all commands as "invalid". In later stages we'll handle executing "valid" commands like `echo`, `cd` etc.
