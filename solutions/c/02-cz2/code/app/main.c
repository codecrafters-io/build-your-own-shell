#include <stdio.h>
#include <string.h>

int main() {
  printf("$ ");
  fflush(stdout);

  // Wait for user input
  char input[100];
  fgets(input, 100, stdin);
  // Remove the trailing newline
  input[strlen(input) - 1] = '\0';
  printf("%s: command not found\n", input);

  return 0;
}
