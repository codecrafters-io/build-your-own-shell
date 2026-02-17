import { createInterface } from "readline";

const rl = createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.on('line', (command) => {
  console.log(`${command}: command not found`);
  rl.close();
});

rl.setPrompt("$ ");
rl.prompt();
