In this stage, you'll extend the `type` builtin to search for executable files using [PATH](https://en.wikipedia.org/wiki/PATH_(variable)).

[PATH](https://en.wikipedia.org/wiki/PATH_(variable)) is an environment variable that specifies a set of directories where executable programs are located. When a command is received, your shell should search for the command in the directories listed in the PATH environment variable.

For example, if PATH is `/dir1:/dir2:/dir3`, your shell should search in `/dir1`, then `/dir2`, and finally `/dir3`, in that order.

- If a matching file is found but it does not have execute permissions, your shell should skip it and continue searching. 
- If a matching files is found and it has execute permissions, your shell should print the path to the file. 
- If no matching files are found, your shell should print `<command>: not found`.

{{#lang_is_elixir}}
It's not recommended to use [System.find_executable](https://hexdocs.pm/elixir/1.18.4/System.html#find_executable/1) if you'd like to learn how to implement the functionality manully.
{{/lang_is_elixir}}

### Tests

The tester will execute your program with a custom `PATH` like this:

```bash
PATH="/usr/bin:/usr/local/bin:$PATH" ./your_program.sh
```

It'll then send a series of `type` commands to your shell:

```bash
$ type ls
ls is /usr/bin/ls
$ type valid_command
valid_command is /usr/local/bin/valid_command
$ type invalid_command
invalid_command: not found
$
```

The tester will check if the `type` command correctly identifies executable files in the PATH.

### Notes

- The actual value of the `PATH` environment variable will be random for each test case.
- Some commands, such as `echo`, can exist as both builtin commands and executable files. In such cases, the `type` command should identify them as builtins.
- PATH can include directories that don’t exist on disk, so your code should handle such cases gracefully.