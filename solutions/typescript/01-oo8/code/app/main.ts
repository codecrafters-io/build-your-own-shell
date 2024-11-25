import { createInterface } from "readline";

const rl = createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false, // Disable input echoing
});

rl.question("$ ", (answer) => {
  rl.close();
});
