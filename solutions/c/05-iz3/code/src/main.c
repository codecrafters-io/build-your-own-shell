#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  // Flush after every printf
  setbuf(stdout, NULL);

  while (1) {
    printf("$ ");

    // Wait for user input
    char input[100];
    if (fgets(input, sizeof(input), stdin) == NULL) {
      break;
    }

    // Remove the trailing newline
    size_t input_length = strlen(input);
    if (input_length > 0 && input[input_length - 1] == '\n') {
      input[input_length - 1] = '\0';
    }

    if (strcmp(input, "exit") == 0) {
      break;
    } else if (strncmp(input, "echo ", 5) == 0) {
      printf("%s\n", input + 5);
    } else {
      printf("%s: command not found\n", input);
    }
  }
  return 0;
}
