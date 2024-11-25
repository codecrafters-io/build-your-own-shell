import { createInterface } from "readline";

const rl = createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false, // Disable input echoing
});

// Uncomment this block to pass the first stage
// rl.question("$ ", (answer) => {
//   rl.close();
// });
