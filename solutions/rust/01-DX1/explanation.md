The entry point for your Shell implementation is in `src/main.rs`.

Study and uncomment the relevant code: 

```rust
// Uncomment this block to pass the first stage
if match_pattern(&input_line, &pattern) {
    process::exit(0)
} else {
    process::exit(1)
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
