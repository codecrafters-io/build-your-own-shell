In this stage, you'll implement the `jobs` builtin to list a single background job.

### Tracking Background Jobs

When a command runs in the background with `&`, your shell needs to keep track of it. You'll need a data structure (like a list or table) that stores the following information about each background job:
- Job number (starts at 1, increments for each new job)
- Process ID
- Command string
- Status (e.g., Running)

### The `jobs` Output Format

The `jobs` builtin prints one line per job with this format:

```
[1]+  Running                 sleep 10 &
```

Breaking this down:
- `[1]` - Job number in brackets
- `+` - Marker indicating the most recent job (always `+` when there's only one job)
- Two spaces
- `Running` - Status, padded to 24 characters total. Since "Running" is `7` characters, it's followed by `17` spaces to fill the field
- `sleep 10 &` - The command that was run

The trailing ` &` at the end of the command is optional. Bash includes it to indicate the job was started in the background, but you can omit it if you prefer.

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
- The status field should be padded to 24 characters total (including "Running" and trailing spaces).
