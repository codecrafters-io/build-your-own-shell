Several background jobs can finish between calls to `jobs`. In this stage, you'll report every completed job while continuing to list those still running.

### Reaping multiple background jobs

When several background jobs are running, and some of them finish, your shell needs to check all of them during the next `jobs` call. 

Checking for completion must remain non-blocking, so a long-running job cannot delay reports for jobs that have already finished.

Like in previous stages, each completed job appears with status `Done` in the `jobs` output, then gets removed from the job table. The next `jobs` call won't show those completed jobs anymore. They only appear once as `Done` before being removed.

### Dynamic marker updates

In the current report, assign markers using the jobs still known to the shell, including those being reported as `Done`. After removing completed jobs, the next report assigns markers using the remaining jobs.

A recap on how markers are assigned:
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

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

It will create background jobs and let selected jobs finish before running `jobs`. The FIFO-writing commands below represent tester actions in a separate process:
```bash
# Start three background jobs
$ sleep 500 &
[1] <pid>
$ cat /path/to/fifo1 &
[2] <pid>
$ cat /path/to/fifo2 &
[3] <pid>

# Terminate job 2 by writing to its FIFO
$ echo -ne "" > /path/to/fifo1

# Check jobs - job 2 should show as Done
$ jobs
[1]   Running                 sleep 500 &
[2]-  Done                    cat /path/to/fifo1
[3]+  Running                 cat /path/to/fifo2 &

# Terminate job 3 by writing to its FIFO
$ echo -ne "" > /path/to/fifo2

# Check jobs - job 3 should show as Done, job 2 already removed
$ jobs
[1]-  Running                 sleep 500 &
[3]+  Done                    cat /path/to/fifo2

# Check jobs - job 3 should be removed, only job 1 remains
$ jobs
[1]+  Running                 sleep 500 &
```

The tester will verify that:
- Done jobs appear in the output once with status `Done`
- Done jobs are removed from the job table after being displayed
- Markers are recalculated correctly after each removal

### Notes

- Multiple jobs can finish between `jobs` calls. Report each completion once.
- Job numbers are stable. A job keeps its number for its entire lifetime.
- Removing a job changes which remaining jobs receive markers. It does not renumber those jobs.
