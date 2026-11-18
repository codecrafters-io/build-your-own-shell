The `jobs` builtin can describe a background command after it has started. In this stage, you'll replace its empty response with one running-job entry.

### Tracking background jobs

The shell needs to associate the job number it printed at launch with the child's PID and the command text. That association lets `jobs` describe the same running command later. How you store the association is your choice.

### The `jobs` output format

For this stage, you need to list a single job that is still running using the `jobs` builtin.

The `jobs` builtin lists background jobs in this format:

```bash
[1]+  Running                 sleep 10 &
```

Breaking this down:
- `[1]` - The job number in brackets
- `+` - A marker indicating the most recent job (always `+` when there's only one job)
- Two spaces
- `Running` - The status, padded to 24 characters total. Since "Running" is `7` characters, it's followed by `17` spaces to fill the field
- `sleep 10 &` - The command that was run

When listing background jobs, the trailing ` &` at the end of the command is optional. Bash includes it to indicate the job was started in the background, but other shells like Zsh omit it.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

It will then start a background job and run `jobs`:

```bash
$ sleep 10 &
[1] 84470
$ jobs
[1]+  Running                 sleep 10 &
```

The tester will verify that:
- The job is listed with the correct format
- The job number is `[1]`
- The marker is `+`
- The status is `Running`
- The command matches what was run (the trailing ` &` is optional)

### Notes

- You only need to list jobs that are still running. Detecting when jobs exit will come in later stages.
- The tester will only test with a single background job in this stage.
