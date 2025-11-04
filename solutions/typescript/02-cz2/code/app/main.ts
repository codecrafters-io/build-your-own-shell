import { createInterface } from "readline";

const rl = createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("$ ", (command) => {
  console.log(`${command}: command not found`);
  rl.close();
});
