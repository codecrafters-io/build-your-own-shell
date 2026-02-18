In this stage, you'll implement reaping background children and reporting when they exit.

### Tests

The tester will execute your program like this:

```bash
$ ./your_shell.sh
```

```bash
# Expect: Prompt returns; job line e.g. [1] <pid>
$ sleep 1 &
[1] 84470
$ 

# After the job exits (~1s), the next prompt is preceded by a Done line
# Expect: [1]+  Done  sleep 1  (or similar), then prompt
$ 
[1]+  Done                    sleep 1
$

# Expect: jobs no longer lists that job
$ jobs
$ 
```

Implementation load:
[expt d723b2b] Add reaping children
 2 files changed, 78 insertions(+), 9 deletions(-)