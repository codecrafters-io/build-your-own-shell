The entry point for your Shell implementation is in `src/main.zig`.

Study and uncomment the relevant code: 

```zig
// Uncomment this block to pass the first stage
const stdout = std.io.getStdOut().writer();
try stdout.print("$ ", .{});
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
