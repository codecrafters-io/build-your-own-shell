#include <stdio.h>

int main() {
  // Flush after every printf
  setbuf(stdout, NULL);

  printf("$ ");

  // Wait for user input
  char input[100];
  fgets(input, 100, stdin);
  return 0;
}
