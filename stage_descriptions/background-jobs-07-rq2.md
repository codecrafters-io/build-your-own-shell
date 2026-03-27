In this stage, you'll handle reaping multiple background jobs.

### Reaping Multiple Background Jobs

When several background jobs are running, and some of them finish, your shell needs to check all of them during the next `jobs` call. Loop through your background jobs and check each one to see if it has exited (using the non-blocking check from the previous stages).

Each completed job appears with status `Done` in the `jobs` output, then gets removed from the job table. The next `jobs` call won't show those completed jobs anymore. They only appear once as `Done` before being removed.

### Dynamic Marker Updates

The `+` and `-` markers are recalculated after removing completed jobs. The markers are always based on the current list of jobs, not the original job numbers.

Here's how markers are assigned:
- The job with the highest job number gets `+` (most recent)
- The job with the second-highest job number gets `-` (previous)
- All other jobs get a space

When jobs are removed, the markers shift:
```bash
$ sleep 100 & 
[1] 10886
$ sleep 5 & 
[2] 10887
$ sleep 6 & 
[3] 10892

# After jobs 2 and 3 have completed
$ jobs
[1]   Running                 sleep 100 &
[2]-  Done                    sleep 5
[3]+  Done                    sleep 6

# Next jobs call: completed jobs removed, job 1 promoted to +
$ jobs
[1]+  Running                 sleep 100 &
```

Job 1 started with no marker (space), but after jobs 2 and 3 are removed, it's the only remaining job and gets promoted to `+`.

### Tests

The tester will execute your program:
```bash
$ ./your_program.sh
```

It will create three background jobs:
```bash
$ sleep 500 &
[1] <pid>
$ cat /path/to/fifo1 &
[2] <pid>
$ cat /path/to/fifo2 &
[3] <pid>
```

The tester will make job 2 exit by writing to fifo1:
```bash
$ jobs
[1]   Running                 sleep 500 &
[2]-  Done                    cat /path/to/fifo1
[3]+  Running                 cat /path/to/fifo2 &
```

The tester will make job 3 exit by writing to fifo2:
```bash
$ jobs
[1]-  Running                 sleep 500 &
[3]+  Done                    cat /path/to/fifo2
```

The tester will check the remaining job:
```bash
$ jobs
[1]+  Running                 sleep 500 &
```

The tester will verify that:
- Done jobs appear in the output once with status `Done`
- Done jobs are removed from the job table after being displayed
- Markers are recalculated correctly after each removal
- Job 1 is promoted to `+` after jobs 2 and 3 are removed

### Notes

- Loop through all jobs and check each one for completion. Multiple jobs might finish between `jobs` calls.
- Job numbers are stable. A job keeps its number for its entire lifetime.
- Markers are always based on the current list of remaining jobs, not the original job numbers.
