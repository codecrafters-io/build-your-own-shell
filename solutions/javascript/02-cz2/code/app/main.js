const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false, // Disable input echoing
});

rl.question("$ ", (answer) => {
  console.log(`${answer}: command not found`);
  rl.close();
});
