The entry point for your Shell implementation is in `app/main.ts`.

Study and uncomment the relevant code: 

```typescript
// Uncomment this block to pass the first stage
import { createInterface } from 'readline';
```

```typescript
// Uncomment this block to pass the first stage
const rl = createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('$ ', (answer) => {
  rl.close();
});
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
