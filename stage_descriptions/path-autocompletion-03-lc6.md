In this stage, you'll add support for completion inside arbitrary paths.

### Completion in Paths

When completing a token that contains a path (e.g., with `/`):

1. Split the token into a directory part and a prefix.
2. List entries inside the specified directory that match the prefix.
3. Complete the token with:

   * A trailing `/` if the match is a directory
   * A trailing space if the match is a file

For example:

```bash
$ cat /path/to/f<TAB>
# In the same line
$ cat /path/to/file.txt 

$ ls ../relative/../path/to/dire<TAB>
# In the same line
$ ls ../relative/../path/to/directory/
```

### Tests

The tester will create the following:
- A single file inside an arbitrary directory. Eg. `/path/to/file.txt`
- A single directory inside an arbitrary directory. Eg. `../relative/../path/to/directory`

The tester will then execute your program like this:

```bash
$ ./your_program.sh
```

It will then simulate user input and tab presses:

```bash
$ cat /path/to/f<TAB>

# In the same line
# With a trailing space
$ cat /path/to/file.txt 

$ ls ../relative/../path/to/dire<TAB>

# In the same line
# Without a trailing space
$ ls ../relative/../path/to/directory/
```

The tester will verify that:

- Pressing tab after the given text autocompletes to the file or directory name
- A trailing space is inserted in case of file, and a trailing slash is inserted in case of directory.


### Notes

- In this stage, you'll only need to handle cases of single matching completion, we'll get to implementing multiple completions in the later stages.