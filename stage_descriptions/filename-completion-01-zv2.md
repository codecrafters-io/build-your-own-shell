Filename completion helps users fill in command arguments from files on disk. In this stage, you'll complete a filename from the current working directory.

### Filename completion

Filename completion is a shell feature that helps users complete filename arguments by pressing the `<TAB>` key.

The current working directory is the directory the shell uses to resolve relative paths. While the user types an argument, Tab should replace its partial filename with a matching name from that directory. This edits the current input line without executing the command. Successive prompt lines below show the same line before and after a keypress.

For example:

```bash
$ cat re<TAB>
$ cat readme.txt 
#                ^ note the trailing space
```

For the input `"cat re"`, the filename prefix is `"re"`. When exactly one filename starts with that prefix, complete the filename and add a trailing space. Leave the command name unchanged.

The trailing whitespace lets the user immediately start typing the next argument without manually adding a space.

### Tests

The tester will create a file in the current directory (e.g., `readme.txt`) and execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input with a partial filename:

```bash
$ cat re<TAB>
$ cat readme.txt 

$ cat hello<TAB>
$ cat hello_world.py 
```

The tester will verify that:

- Pressing tab completes the partial filename to the full filename
- A trailing space is added after the filename

### Notes

- For this stage, you only need to match the prefix against files in the current working directory. We'll implement completion in nested directories in later stages.
- For this stage, you only need to handle cases of a single matching filename. We'll implement directory completion and multiple completions in later stages.
- Completion applies to arguments of any command. Even for a nonexistent command like `xyz`, `xyz read<TAB>` becomes `xyz readme.txt ` when that file is the unique match.
