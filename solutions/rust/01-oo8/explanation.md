The entry point for your Shell implementation is in `src/main.rs`.

Study and uncomment the relevant code: 

```rust
// Uncomment this block to pass the first stage
let stdin = io::stdin();
loop {
    print!("$ ");
    io::stdout().flush().unwrap();
    let mut input = String::new();
    stdin.read_line(&mut input).unwrap();
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
