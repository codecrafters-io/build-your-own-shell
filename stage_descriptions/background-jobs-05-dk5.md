In this stage, you'll extend the `jobs` builtin to list multiple background jobs.

### Displaying Multiple Background Jobs

When multiple commands run in the background, `jobs` lists them in the order they were started. Job numbers are assigned sequentially, starting from 1.

The shell uses markers to indicate special jobs:
- `+` - The most recently started job (the "current" job)
- `-` - The second most recently started job (the "previous" job)  
- ` ` (space) - All other jobs

For example, with three background jobs:
```bash
$ sleep 10 &
[1] 96643
$ sleep 20 &
[2] 96644
$ sleep 30 &
[3] 96645
$ jobs
[1]   Running                 sleep 10 &
[2]-  Running                 sleep 20 &
[3]+  Running                 sleep 30 &
```

Job 3 is the most recent (gets `+`), job 2 is the previous (gets `-`), and job 1 gets a space.

### Tests

The tester will execute your program:

```bash
$ ./your_program.sh
```

It will launch jobs and verify the `jobs` output after each one:

```bash
$ sleep 10 & 
[1] 96643
$ jobs
[1]+  Running                 sleep 10 &

$ sleep 20 & 
[2] 96644
$ jobs
[1]-  Running                 sleep 10 &
[2]+  Running                 sleep 20 &

$ sleep 30 &
[3] 96645
$ jobs
[1]   Running                 sleep 10 &
[2]-  Running                 sleep 20 &
[3]+  Running                 sleep 30 &
```

The tester will verify that:
- Jobs are listed in order by job number
- The most recent job has the `+` marker
- The second most recent job has the `-` marker
- All other jobs have a space in the marker column

### Notes

- Jobs should always be displayed in order by job number (1, 2, 3...), not in the order they were most recently touched.
- You only need to track launched jobs. Detecting when jobs exit will come in later stages.
