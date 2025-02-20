#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  // Flush after every printf
  setbuf(stdout, NULL);

  // Uncomment this block to pass the first stage
  // printf("$ ");

  // Wait for user input
  char input[100];
  fgets(input, 100, stdin);
  return 0;
}
