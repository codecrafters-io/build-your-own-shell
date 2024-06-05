The entry point for your Shell implementation is in `app/main.js`.

Study and uncomment the relevant code: 

```javascript
// Uncomment this block to pass the first stage
const readline = require("readline");
```

```javascript
// Uncomment this block to pass the first stage
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("$ ", (answer) => {
  rl.close();
});
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
