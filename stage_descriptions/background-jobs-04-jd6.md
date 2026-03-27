In this stage, you'll implement the `jobs` builtin to list a single background job.

### Tracking Background Jobs

Your shell needs to keep track of jobs running in the background. To do that, you'll need a data structure (like a list or table) that stores the following information about each job:
- Job number (starts at 1, increments for each new job)
- Process ID
- Command string
- Status (e.g., Running)

### The `jobs` Output Format

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
- The status field should be padded to 24 characters total (including "Running" and trailing spaces).
