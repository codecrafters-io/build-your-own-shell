In this stage, you'll add support for running external programs with arguments.

External programs are located using the `PATH` environment variable, as described in previous stages.

### Tests

The tester will execute your program like this:

```bash
./your_program.sh
```

It'll then send a command that you need to execute:

```bash
$ custom_exe_1234 alice
Program was passed 2 args (including program name).
Arg #0 (program name): custom_exe_1234
Arg #1: alice
Program Signature: 5998595441
```

The command (`custom_exe_1234`) in the example above will be present in `PATH` and will be an executable file.

The executable file will print information about the arguments it was passed along with a random "program signature". The tester will verify that your program prints output from the executable.

The tester will run multiple such commands and use a random number of arguments each time.

### Notes

- The program name, arguments and the expected output will be random for each test case.
- The output in the example ("Program was passed N args...") comes from the executable. It's not something you need to implement manually.