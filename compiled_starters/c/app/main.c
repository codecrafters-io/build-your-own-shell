#include <stdio.h>

int main() {
  // You can use print statements as follows for debugging, they'll be visible when running tests
  printf("Logs from your program will appear here!\n");

  // Uncomment this block to pass the first stage
  // printf("$ ");
  // fflush(stdout);

  // Wait for user input
  char input[100];
  fgets(input, 100, stdin);
  return 0;
}
